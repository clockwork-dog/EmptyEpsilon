#include "systemsMonitor.h"

#include "playerInfo.h"
#include "spaceObjects/playerSpaceship.h"
#include "screenComponents/customShipFunctions.h"
#include "screenComponents/systemEffectsList.h"
#include "screenComponents/powerDamageIndicator.h"

#include "gui/gui2_autolayout.h"
#include "gui/gui2_panel.h"
#include "gui/gui2_label.h"
#include "gui/gui2_slider.h"
#include "gui/gui2_progressbar.h"
#include "gui/gui2_keyvaluedisplay.h"

SystemsMonitorScreen::SystemsMonitorScreen(GuiContainer* owner)
: GuiOverlay(owner, "SYSTEMS_MONITOR_SCREEN", colorConfig.background)
{
    GuiAutoLayout* layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutHorizontalLeftToRight);
    layout->setPosition(20, 20, ATopLeft)->setSize(GuiElement::GuiSizeMax, 400);
    for(int n=0; n<SYS_COUNT; n++)
    {
        if (n == 6)
        {
            //Start the 2nd row after 4 elements (now 5).
            layout = new GuiAutoLayout(this, "", GuiAutoLayout::LayoutHorizontalLeftToRight);
            layout->setPosition(20, 450, ATopLeft)->setSize(GuiElement::GuiSizeMax, 400);
        }

        GuiPanel* box = new GuiPanel(layout, "");
        systems[n].box = box;
        box->setSize(290, 400);

        (new GuiLabel(box, "", getLocaleSystemName(ESystem(n)), 30))->setAlignment(ACenter)->setPosition(0, 0, ATopCenter)->setSize(270, 50);

        (new GuiPowerDamageIndicator(box, n + "_INDICATOR", ESystem(n), ATopCenter, my_spaceship))->setPosition(0, 40, ATopCenter)->setSize(270, 30);

        systems[n].system_effects_container = new GuiSystemEffectsList(box,"",GuiAutoLayout::LayoutVerticalTopToBottom);
        systems[n].system_effects_container->setPosition(0, 60, ATopCenter)->setSize(280, 400);
        systems[n].system_effects_container->selectSystem(ESystem(n));
        systems[n].system_effects_container->setPrimaryInfoVisible(true);
        systems[n].system_effects_container->isBackground(false);
    }

    (new GuiCustomShipFunctions(this, systemsMonitor, "", my_spaceship))->setPosition(-20, 120, ATopRight)->setSize(250, GuiElement::GuiSizeMax);

}

void SystemsMonitorScreen::onDraw(sf::RenderTarget& window)
{
    GuiOverlay::onDraw(window);
    if (my_spaceship)
    {
        for(int n=0; n<SYS_COUNT; n++)
            systems[n].box->setVisible(my_spaceship->hasSystem(ESystem(n)));
    }
}

