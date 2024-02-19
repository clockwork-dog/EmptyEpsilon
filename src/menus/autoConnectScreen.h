#ifndef AUTO_CONNECT_SCREEN_H
#define AUTO_CONNECT_SCREEN_H

#include "gui/gui2_canvas.h"
#include "playerInfo.h"

class GuiOverlay;
class GuiPanel;
class GuiButton;
class GuiToggleButton;
class GuiTextEntry;
class GuiLabel;
class GuiControlNumericEntryPanel;

class AutoConnectScreen : public GuiCanvas, public Updatable
{
	GuiOverlay* screen_connect;
    P<ServerScanner> scanner;
    sf::IpAddress connect_to_address;
    ECrewPosition crew_position;
    bool control_main_screen;
    bool waiting_for_password;
    int auto_mainscreen;
    std::map<string, string> ship_filters;
    GuiOverlay* password_overlay;
    GuiLabel* password_label;
    GuiPanel* password_entry_box;
    GuiTextEntry* password_entry;
    GuiButton* password_entry_ok;
    GuiButton* password_confirmation;
    GuiOverlay* control_code_numeric_panel_overlay;
    GuiControlNumericEntryPanel* control_code_numeric_panel;

    GuiLabel* status_label;
    GuiLabel* filter_label;
public:
    AutoConnectScreen(ECrewPosition crew_position, int auto_mainscreen, bool control_main_screen, string ship_filter);
    void autoConnectPasswordEntryOnOkClick();
    void autoConnectPasswordEntryOnEnter(string text);
    virtual ~AutoConnectScreen();

    virtual void update(float delta);

private:
    bool isValidShip(int index);
    void connectToShip(int index);
    void connectToMyShip();
    bool is_integer(const std::string& string);
};

#endif//AUTO_CONNECT_SCREEN_H
