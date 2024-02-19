#include "main.h"
#include "autoConnectScreen.h"
#include "preferenceManager.h"
#include "screenComponents/noiseOverlay.h"
#include "epsilonServer.h"
#include "gameGlobalInfo.h"
#include "playerInfo.h"

#include "gui/gui2_label.h"
#include "gui/gui2_overlay.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_textentry.h"
#include "gui/gui2_togglebutton.h"
#include "../screenComponents/numericEntryPanel.h"

AutoConnectScreen::AutoConnectScreen(ECrewPosition crew_position, int auto_mainscreen, bool control_main_screen, string ship_filter)
: crew_position(crew_position), auto_mainscreen(auto_mainscreen) , control_main_screen(control_main_screen)
{
    if (!game_client)
    {
        scanner = new ServerScanner(VERSION_NUMBER);
        scanner->scanLocalNetwork();
    }

    new GuiNoiseOverlay(this);

    status_label = new GuiLabel(this, "STATUS", "Searching for server...", 50);
    status_label->setPosition(0, 300, ATopCenter)->setSize(0, 50);

    string position_name = "Main screen";
    if (crew_position < max_crew_positions)
        position_name = getCrewPositionName(crew_position);
    if (auto_mainscreen == 1)
        position_name = "Main screen";

    (new GuiLabel(this, "POSITION", position_name, 50))->setPosition(0, 400, ATopCenter)->setSize(0, 30);
    
    filter_label = new GuiLabel(this, "FILTER", "", 20);
    filter_label->setPosition(0, 30, ATopCenter)->setSize(0, 10);

    for(string filter : ship_filter.split(";"))
    {
        std::vector<string> key_value = filter.split("=", 1);
        string key = key_value[0].strip().lower();
        if (key.length() < 1)
            continue;

        if (key_value.size() == 1)
            ship_filters[key] = "1";
        else if (key_value.size() == 2)
            ship_filters[key] = key_value[1].strip();
        LOG(INFO) << "Auto connect filter: " << key << " = " << ship_filters[key];
        filter_label->setText(filter_label->getText() + key + " : " + ship_filters[key] + " ");
    }

    if (PreferencesManager::get("instance_name") != "")
    {
        (new GuiLabel(this, "", PreferencesManager::get("instance_name"), 25))->setAlignment(ACenterLeft)->setPosition(20, 20, ATopLeft)->setSize(0, 18);
    }
}

bool AutoConnectScreen::is_integer(const std::string& string)
{
    return !string.empty() && std::find_if(string.begin(), string.end(), [](char c) { return !std::isdigit(c); }) == string.end();
};

AutoConnectScreen::~AutoConnectScreen()
{
    if (scanner)
        scanner->destroy();
}

void AutoConnectScreen::update(float delta)
{
    if (scanner)
    {
        std::vector<ServerScanner::ServerInfo> serverList = scanner->getServerList();
        string autoconnect_address = PreferencesManager::get("autoconnect_address", "");

        if (autoconnect_address != "") {
            status_label->setText("Using autoconnect server " + autoconnect_address);
            connect_to_address = autoconnect_address;
            new GameClient(VERSION_NUMBER, autoconnect_address);
            scanner->destroy();
        } else if (serverList.size() > 0) {
            status_label->setText("Found server " + serverList[0].name);
            connect_to_address = serverList[0].address;
            new GameClient(VERSION_NUMBER, serverList[0].address);
            scanner->destroy();
        } else {
            status_label->setText("Searching for server...");
        }
    }else{
        switch(game_client->getStatus())
        {
        case GameClient::ReadyToConnect:
        case GameClient::Connecting:
        case GameClient::Authenticating:
            status_label->setText("Connecting: " + connect_to_address.toString());
            break;
        case GameClient::WaitingForPassword: //For now, just disconnect when we found a password protected server.
        case GameClient::Disconnected:
            disconnectFromServer();
            scanner = new ServerScanner(VERSION_NUMBER);
            scanner->scanLocalNetwork();
            break;
        case GameClient::Connected:
            if (game_client->getClientId() > 0)
            {
                foreach(PlayerInfo, i, player_info_list)
                    if (i->client_id == game_client->getClientId())
                        my_player_info = i;
                if (my_player_info && gameGlobalInfo)
                {
                    status_label->setText("Waiting for ship on " + connect_to_address.toString() + "...");
                    if (!my_spaceship)
                    {
                        for(int n=0; n<GameGlobalInfo::max_player_ships; n++)
                        {
                            if (isValidShip(n))
                            {
                                connectToShip(n);
                                break;
                            }
                        }
                    } else {
                        if (my_spaceship->getMultiplayerId() == my_player_info->ship_id && (auto_mainscreen == 1 || crew_position == max_crew_positions || my_player_info->crew_position[crew_position]))
                        {
                            if (auto_mainscreen == 1)
                            {
                                for(int n=0; n<max_crew_positions; n++)
                                    my_player_info->commandSetCrewPosition(crew_position, false);
                            }

                            if(!waiting_for_password) {
                                status_label->hide();
                                connectToMyShip();
                            }
                        }
                    }
                }else{
                    status_label->setText("Connected, waiting for game data...");
                }
            }
            break;
        }
    }
}

void AutoConnectScreen::autoConnectPasswordEntryOnOkClick() {
        P<PlayerSpaceship> ship = my_spaceship;

        if (ship)
        {
            // Get the password.
            string password = password_entry->getText();
            string control_code = ship->control_code;

            if (password != control_code)
            {
                // Password doesn't match. Unset the player ship selection.
                LOG(INFO) << "Password doesn't match control code. Attempt: " << password;
                my_player_info->commandSetShipId(-1);
                // Notify the player.
                password_label->setText("Incorrect control code. Re-enter code for " + ship->getCallSign() + ":");
                // Reset the dialog.
                password_entry->setText("");
            }
            else
            {
                // Password matches.
                LOG(INFO) << "Password matches control code.";
                // Set the player ship.
                my_player_info->commandSetShipId(ship->getMultiplayerId());
                // Notify the player.
                password_label->setText("Control code accepted.\nGranting access to " + ship->getCallSign() + ".");
                // Reset and hide the password field.
                password_entry->setText("");
                password_entry->hide();
                password_entry_ok->hide();
                // Show a confirmation button.
                password_confirmation->show();

                destroy();
                my_player_info->spawnUI();
            }
        }
}

void AutoConnectScreen::connectToMyShip() {
    P<PlayerSpaceship> ship = my_spaceship;
    waiting_for_password = false;

    // Control code entry dialog.
    password_overlay = new GuiOverlay(this, "PASSWORD_OVERLAY", sf::Color::Black - sf::Color(0, 0, 0, 192));
    password_overlay->hide();
    password_entry_box = new GuiPanel(password_overlay, "PASSWORD_ENTRY_BOX");
    password_entry_box->setPosition(0, 350, ATopCenter)->setSize(600, 200);
    password_label = new GuiLabel(password_entry_box, "PASSWORD_LABEL", "Enter this ship's control code:", 30);
    password_label->setPosition(0, 40, ATopCenter);
    password_entry = new GuiTextEntry(password_entry_box, "PASSWORD_ENTRY", "");
    password_entry->setPosition(20, 0, ACenterLeft)->setSize(400, 50);
    password_entry->enterCallback([this](string text)
    {
        this->autoConnectPasswordEntryOnOkClick();
    });

    // Control code entry button.
    password_entry_ok = new GuiButton(password_entry_box, "PASSWORD_ENTRY_OK", "Ok", [this]()
    {
        this->autoConnectPasswordEntryOnOkClick();
    });
    password_entry_ok->setPosition(420, 0, ACenterLeft)->setSize(160, 50);

    // Control code confirmation button
    password_confirmation = new GuiButton(password_entry_box, "PASSWORD_CONFIRMATION_BUTTON", "OK", [this]() {
        // Reset the dialog.
        password_entry->show();
        password_entry_ok->show();
        password_label->setText("Enter this ship's control code:")->setPosition(0, 40, ATopCenter);
        password_confirmation->hide();
        // Hide the dialog.
        password_overlay->hide();
    });
    password_confirmation->setPosition(0, -20, ABottomCenter)->setSize(250, 50)->hide();


    /*************************************************
    ** Control Code - Numeric Entry Pad
    */
    control_code_numeric_panel = new GuiControlNumericEntryPanel(this, "CODE_ENTRY", "Enter this ship's control code");
    control_code_numeric_panel->enterCallback([this](int value) {
        P<PlayerSpaceship> ship = my_spaceship;

        if(ship->control_code.toInt() == value) {
            destroy();
            my_player_info->spawnUI();
        }
        else
        {
            control_code_numeric_panel->setPrompt("Incorrect Control Code");
            control_code_numeric_panel->clearCode();
        }
    });

    control_code_numeric_panel->clearCallback([this](int value) {
        control_code_numeric_panel->clearPrompt();
    });

    if (ship->control_code.length() > 0 && PreferencesManager::get("autoconnect_control_code_bypass", "").toInt() < 1)
    {
        LOG(INFO) << "Autoconnect selected " << ship->getCallSign() << ", which has a control code.";

        if(this->is_integer(ship->control_code) && PreferencesManager::get("autoconnect_control_code_prefer_numeric_pad", "").toInt() > 0) {
            waiting_for_password = true;
            control_code_numeric_panel->show();
        }
        else
        {
            // Show the control code entry dialog.
            waiting_for_password = true;
            password_overlay->show();
        }
    } else {
        destroy();
        my_player_info->spawnUI();
    }
}

bool AutoConnectScreen::isValidShip(int index)
{
    P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(index);

    if (!ship || !ship->ship_template)
        return false;
    
    filter_label->setText("");

    for(auto it : ship_filters)
    {
        if (it.first == "solo")
        {
            int crew_at_position = 0;
            foreach(PlayerInfo, i, player_info_list)
            {
                if (i->ship_id == ship->getMultiplayerId())
                {
                    if (crew_position != max_crew_positions && i->crew_position[crew_position])
                        crew_at_position++;
                }
            }
            if (crew_at_position > 0)
                return false;
        }
        else if (it.first == "faction")
        {
            if (ship->getFactionId() != FactionInfo::findFactionId(it.second))
                return false;
        }
        else if (it.first == "callsign")
        {
            if (ship->getCallSign().lower() != it.second.lower())
                return false;
        }
        else if (it.first == "type")
        {
            if (ship->getTypeName().lower() != it.second.lower())
                return false;
        }
        else
        {
            LOG(WARNING) << "Unknown ship filter: " << it.first << " = " << it.second;
        }
    }
    return true;
}

void AutoConnectScreen::connectToShip(int index)
{
    P<PlayerSpaceship> ship = gameGlobalInfo->getPlayerShip(index);

    if (auto_mainscreen != 1 && crew_position != max_crew_positions)    //If we are not the main screen, setup the right crew position.
    {
        my_player_info->commandSetCrewPosition(crew_position, true);
        my_player_info->commandSetMainScreenControl(control_main_screen);

        // Add more screen
        if (PreferencesManager::get("autostationslist") != "")
        {
            LOG(WARNING) << "Unknown color definition: ";
            for(string station : PreferencesManager::get("autostationslist").split(";"))
            {
                int crew_position_sup = station.toInt() - 1;
                if (crew_position_sup < 0) crew_position_sup = 0;
                if (crew_position_sup > max_crew_positions) crew_position_sup = max_crew_positions;
                my_player_info->commandSetCrewPosition(ECrewPosition(crew_position_sup), true);
            }
        }
    }
    my_player_info->commandSetShipId(ship->getMultiplayerId());
}
