#include "playerInfo.h"
#include "numericEntryPanel.h"

#include "gui/gui2_panel.h"
#include "gui/gui2_overlay.h"
#include "gui/gui2_label.h"
#include "gui/gui2_button.h"
#include "gui/gui2_autolayout.h"

GuiControlNumericEntryPanel::GuiControlNumericEntryPanel(GuiCanvas* owner, string id, string title): GuiElement(owner, id)
{
    canvas = owner;
    setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    
    overlay = new GuiOverlay(this, id + "_OVERLAY", sf::Color::Black - sf::Color(0, 0, 0, 192));
    overlay->setBlocking(true);
    box = new GuiPanel(overlay, id + "_BOX");
    box->setPosition(0, 0, ACenter);
    GuiAutoLayout* layout = new GuiAutoLayout(box, id + "_LAYOUT", GuiAutoLayout::LayoutVerticalTopToBottom);
    layout->setSize(GuiElement::GuiSizeMax, GuiElement::GuiSizeMax);
    title_label = new GuiLabel(layout, id + "_LABEL", title, 50);
    title_label->setSize(GuiElement::GuiSizeMax, 80);
    code_label = new GuiLabel(layout, id + "_CODE_LABEL", "", 30);
    code_label->addBackground()->setSize(GuiElement::GuiSizeMax, 50);
    
    code_entry = new GuiElement(layout, id + "_ENTRY_ELEMENT");
    code_entry->setSize(250, 320);
    
    prompt_label = new GuiLabel(code_entry, id + "_ENTRY_LABEL", "", 30);
    prompt_label->addBackground()->setSize(GuiElement::GuiSizeMax, 50);
    code_entry_label = new GuiLabel(code_entry, id + "_ENTRY_LABEL", "", 30);
    code_entry_label->addBackground()->setPosition(0, 50, ATopLeft)->setSize(GuiElement::GuiSizeMax, 50);
    (new GuiButton(code_entry, id + "_BUTTON_7", "7", [this]() {this->addDigit("7");}))->setSize(50, 50)->setPosition(50, 100, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_8", "8", [this]() {this->addDigit("8");}))->setSize(50, 50)->setPosition(100, 100, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_9", "9", [this]() {this->addDigit("9");}))->setSize(50, 50)->setPosition(150, 100, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_4", "4", [this]() {this->addDigit("4");}))->setSize(50, 50)->setPosition(50, 150, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_5", "5", [this]() {this->addDigit("5");}))->setSize(50, 50)->setPosition(100, 150, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_6", "6", [this]() {this->addDigit("6");}))->setSize(50, 50)->setPosition(150, 150, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_1", "1", [this]() {this->addDigit("1");}))->setSize(50, 50)->setPosition(50, 200, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_2", "2", [this]() {this->addDigit("2");}))->setSize(50, 50)->setPosition(100, 200, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_3", "3", [this]() {this->addDigit("3");}))->setSize(50, 50)->setPosition(150, 200, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_Clr", "Clr", [this]() {this->clearDigits(true, true);}))->setSize(50, 50)->setPosition(50, 250, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_0", "0", [this]() {this->addDigit("0");}))->setSize(50, 50)->setPosition(100, 250, ATopLeft);
    (new GuiButton(code_entry, id + "_BUTTON_OK", "OK", [this]() {this->submitDigits();}))->setSize(50, 50)->setPosition(150, 250, ATopLeft);
    code_entry->setVisible(true);
}

void GuiControlNumericEntryPanel::setTitle(string prompt) {
    title_label->setText(prompt);
}

void GuiControlNumericEntryPanel::setPrompt(string prompt) {
    prompt_label->setText(prompt);
}

void GuiControlNumericEntryPanel::clearCode() {
    this->clearDigits(false, false);
}

void GuiControlNumericEntryPanel::clearPrompt() {
    this->setPrompt("");
}

GuiControlNumericEntryPanel* GuiControlNumericEntryPanel::enterCallback(func_t func)
{
    this->enter_func = func;
    return this;
}

GuiControlNumericEntryPanel* GuiControlNumericEntryPanel::clearCallback(func_t func)
{
    this->clear_func = func;
    return this;
}

void GuiControlNumericEntryPanel::addDigit(string digit)
{
    this->clearPrompt();
    string currentText = code_entry_label->getText();

    // Prevent UI overflow due to too many digits
    if(currentText.length() < 20) {
        code_entry_label->setText(currentText + digit);
    }
    
    this->canvas->focus(this);
}

void GuiControlNumericEntryPanel::removeDigit()
{
    this->clearPrompt();
    if(code_entry_label->getText().length() > 0)
    {
        code_entry_label->setText(code_entry_label->getText().substr(0, -1));
    }
    this->canvas->focus(this);
}

void GuiControlNumericEntryPanel::clearDigits(bool clearPrompt, bool doCallback)
{
    if(clearPrompt) {
        this->clearPrompt();
    }
    
    code_entry_label->setText("");
    this->canvas->focus(this);

    if (doCallback && clear_func)
    {
        func_t f = clear_func;
        f(0);
    }
}

void GuiControlNumericEntryPanel::submitDigits()
{
    this->canvas->focus(this);
    if (enter_func)
    {
        func_t f = enter_func;
        f(code_entry_label->getText().toInt());
    }
}


void GuiControlNumericEntryPanel::onDraw(sf::RenderTarget& window)
{
    if (code_entry->isVisible())
        box->setSize(600, code_entry->getPositionOffset().y + code_entry->getSize().y);
    else if (code_label->isVisible())
        box->setSize(600, code_label->getPositionOffset().y + code_label->getSize().y);
    else
        box->setSize(600, 80);
}

GuiElement* GuiControlNumericEntryPanel::show()
{
    GuiElement* returnValue = GuiElement::show();
    this->canvas->focus(this);
    return returnValue;
}

bool GuiControlNumericEntryPanel::onKey(sf::Event::KeyEvent key, int unicode)
{
    bool playSound = true;
    switch(key.code)
        {
            case sf::Keyboard::Num0:
            case sf::Keyboard::Numpad0:
                this->addDigit("0");
                break;
            case sf::Keyboard::Num1:
            case sf::Keyboard::Numpad1:
                this->addDigit("1");
                break;
            case sf::Keyboard::Num2:
            case sf::Keyboard::Numpad2:
                this->addDigit("2");
                break;
            case sf::Keyboard::Num3:
            case sf::Keyboard::Numpad3:
                this->addDigit("3");
                break;
            case sf::Keyboard::Num4:
            case sf::Keyboard::Numpad4:
                this->addDigit("4");
                break;
            case sf::Keyboard::Num5:
            case sf::Keyboard::Numpad5:
                this->addDigit("5");
                break;
            case sf::Keyboard::Num6:
            case sf::Keyboard::Numpad6:
                this->addDigit("6");
                break;
            case sf::Keyboard::Num7:
            case sf::Keyboard::Numpad7:
                this->addDigit("7");
                break;
            case sf::Keyboard::Num8:
            case sf::Keyboard::Numpad8:
                this->addDigit("8");
                break;
            case sf::Keyboard::Num9:
            case sf::Keyboard::Numpad9:
                this->addDigit("9");
                break;
            case sf::Keyboard::BackSpace:
                this->removeDigit();
                break;
            case sf::Keyboard::Return:
                playSound = false;
                this->submitDigits();
                break;
            default:
                playSound = false;
                break;
    }

    if(playSound)
    {
        soundManager->playSound("button.wav");
    }

    return true;
}