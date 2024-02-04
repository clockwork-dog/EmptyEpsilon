#ifndef NUMERIC_ENTRY_PANEL_H
#define NUMERIC_ENTRY_PANEL_H

#include "gui/gui2_element.h"
#include "gui/gui2_canvas.h"
#include "gui/gui2_overlay.h"
#include "spaceObjects/playerSpaceship.h"

class GuiPanel;
class GuiLabel;

class GuiControlNumericEntryPanel : public GuiElement
{
private:
    GuiCanvas* canvas;
    GuiOverlay* overlay;
    GuiPanel* box;
    GuiLabel* title_label;
    GuiLabel* code_label;
    GuiElement* code_entry;
    GuiLabel* prompt_label;
    GuiLabel* code_entry_label;
    int code_entry_position;

    void addDigit(string digit);
    void removeDigit();
    void clearDigits(bool clearPrompt, bool doCallback);
    void submitDigits();
public:
    typedef std::function<void(int number)> func_t;

    GuiControlNumericEntryPanel(GuiCanvas* owner, string id, string title);

    virtual void onDraw(sf::RenderTarget& window) override;
    virtual bool onKey(sf::Event::KeyEvent key, int unicode) override;
    GuiElement* show();

    void setTitle(string prompt);
    void setPrompt(string prompt);
    void clearCode();
    void clearPrompt();

    GuiControlNumericEntryPanel* enterCallback(func_t func);
    GuiControlNumericEntryPanel* clearCallback(func_t func);

protected:
    func_t enter_func;
    func_t clear_func;
};

#endif//NUMERIC_ENTRY_PANEL_H