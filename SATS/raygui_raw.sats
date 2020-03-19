(**
 ** [ raygui ]
 **  
 ** raw raygui bindings for ATS2,
 **
 ** Project: raylib-ats2
 ** Author : M. Bellaire
 ** Year   : 2020
 ** License: MIT
 **)

staload "./raylib_raw.sats"

%{#
#include "raygui.h"
%}
(**  **)

typedef GuiStyleProp = $extype_struct"GuiStyleProp" of {
   controlId = usint
 , propertyId = usint
 , propertyValue = int
}

abst@ype GuiControlState = $extype"GuiControlState"

macdef GUI_STATE_NORMAL = $extval(GuiControlState,"GUI_STATE_NORMAL")
macdef GUI_STATE_FOCUSED = $extval(GuiControlState,"GUI_STATE_FOCUSED")
macdef GUI_STATE_PRESSED = $extval(GuiControlState,"GUI_STATE_PRESSED")
macdef GUI_STATE_DISABLED = $extval(GuiControlState,"GUI_STATE_DISABLED")

abst@ype GuiTextAlignment = $extype"GuiTextAlignment"

macdef GUI_TEXT_ALIGN_LEFT = $extval(GuiTextAlignment,"GUI_TEXT_ALIGN_LEFT")
macdef GUI_TEXT_ALIGN_CENTER = $extval(GuiTextAlignment,"GUI_TEXT_ALIGN_CENTER")
macdef GUI_TEXT_ALIGN_RIGHT = $extval(GuiTextAlignment,"GUI_TEXT_ALIGN_RIGHT")

abst@ype GuiControl = $extype"GuiControl"

macdef DEFAULT = $extval(GuiControl,"DEFAULT")
macdef LABEL = $extval(GuiControl,"LABEL")
macdef BUTTON = $extval(GuiControl,"BUTTON")
macdef TOGGLE = $extval(GuiControl,"TOGGLE")
macdef SLIDER = $extval(GuiControl,"SLIDER")
macdef PROGRESSBAR = $extval(GuiControl,"PROGRESSBAR")
macdef CHECKBOX = $extval(GuiControl,"CHECKBOX")
macdef COMBOBOX = $extval(GuiControl,"COMBOBOX")
macdef DROPDOWNBOX = $extval(GuiControl,"DROPDOWNBOX")
macdef TEXTBOX = $extval(GuiControl,"TEXTBOX")
macdef VALUEBOX = $extval(GuiControl,"VALUEBOX")
macdef SPINNER = $extval(GuiControl,"SPINNER")
macdef LISTVIEW = $extval(GuiControl,"LISTVIEW")
macdef COLORPICKER = $extval(GuiControl,"COLORPICKER")
macdef SCROLLBAR = $extval(GuiControl,"SCROLLBAR")
macdef STATUSBAR = $extval(GuiControl,"STATUSBAR")

abst@ype GuiControlProperty = $extype"GuiControlProperty"

macdef BORDER_COLOR_NORMAL = $extval(GuiControlProperty,"BORDER_COLOR_NORMAL")
macdef BASE_COLOR_NORMAL = $extval(GuiControlProperty,"BASE_COLOR_NORMAL")
macdef TEXT_COLOR_NORMAL = $extval(GuiControlProperty,"TEXT_COLOR_NORMAL")
macdef BORDER_COLOR_FOCUSED = $extval(GuiControlProperty,"BORDER_COLOR_FOCUSED")
macdef BASE_COLOR_FOCUSED = $extval(GuiControlProperty,"BASE_COLOR_FOCUSED")
macdef TEXT_COLOR_FOCUSED = $extval(GuiControlProperty,"TEXT_COLOR_FOCUSED")
macdef BORDER_COLOR_PRESSED = $extval(GuiControlProperty,"BORDER_COLOR_PRESSED")
macdef BASE_COLOR_PRESSED = $extval(GuiControlProperty,"BASE_COLOR_PRESSED")
macdef TEXT_COLOR_PRESSED = $extval(GuiControlProperty,"TEXT_COLOR_PRESSED")
macdef BORDER_COLOR_DISABLED = $extval(GuiControlProperty,"BORDER_COLOR_DISABLED")
macdef BASE_COLOR_DISABLED = $extval(GuiControlProperty,"BASE_COLOR_DISABLED")
macdef TEXT_COLOR_DISABLED = $extval(GuiControlProperty,"TEXT_COLOR_DISABLED")
macdef BORDER_WIDTH = $extval(GuiControlProperty,"BORDER_WIDTH")
macdef TEXT_PADDING = $extval(GuiControlProperty,"TEXT_PADDING")
macdef TEXT_ALIGNMENT = $extval(GuiControlProperty,"TEXT_ALIGNMENT")
macdef RESERVED = $extval(GuiControlProperty,"RESERVED")

abst@ype GuiDefaultProperty = $extype"GuiDefaultProperty"

macdef TEXT_SIZE = $extval(GuiDefaultProperty,"TEXT_SIZE")
macdef TEXT_SPACING = $extval(GuiDefaultProperty,"TEXT_SPACING")
macdef LINE_COLOR = $extval(GuiDefaultProperty,"LINE_COLOR")
macdef BACKGROUND_COLOR = $extval(GuiDefaultProperty,"BACKGROUND_COLOR")

abst@ype GuiToggleProperty = $extype"GuiToggleProperty"

macdef GROUP_PADDING = $extval(GuiToggleProperty,"GROUP_PADDING")

abst@ype GuiSliderProperty = $extype"GuiSliderProperty"

macdef SLIDER_WIDTH = $extval(GuiSliderProperty,"SLIDER_WIDTH")
macdef SLIDER_PADDING = $extval(GuiSliderProperty,"SLIDER_PADDING")

abst@ype GuiProgressBarProperty = $extype"GuiProgressBarProperty"

macdef PROGRESS_PADDING = $extval(GuiProgressBarProperty,"PROGRESS_PADDING")

abst@ype GuiCheckBoxProperty = $extype"GuiCheckBoxProperty"

macdef CHECK_PADDING = $extval(GuiCheckBoxProperty,"CHECK_PADDING")

abst@ype GuiComboBoxProperty = $extype"GuiComboBoxProperty"

macdef COMBO_BUTTON_WIDTH = $extval(GuiComboBoxProperty,"COMBO_BUTTON_WIDTH")
macdef COMBO_BUTTON_PADDING = $extval(GuiComboBoxProperty,"COMBO_BUTTON_PADDING")

abst@ype GuiDropdownBoxProperty = $extype"GuiDropdownBoxProperty"

macdef ARROW_PADDING = $extval(GuiDropdownBoxProperty,"ARROW_PADDING")
macdef DROPDOWN_ITEMS_PADDING = $extval(GuiDropdownBoxProperty,"DROPDOWN_ITEMS_PADDING")

abst@ype GuiTextBoxProperty = $extype"GuiTextBoxProperty"

macdef TEXT_INNER_PADDING = $extval(GuiTextBoxProperty,"TEXT_INNER_PADDING")
macdef TEXT_LINES_PADDING = $extval(GuiTextBoxProperty,"TEXT_LINES_PADDING")
macdef COLOR_SELECTED_FG = $extval(GuiTextBoxProperty,"COLOR_SELECTED_FG")
macdef COLOR_SELECTED_BG = $extval(GuiTextBoxProperty,"COLOR_SELECTED_BG")

abst@ype GuiSpinnerProperty = $extype"GuiSpinnerProperty"

macdef SPIN_BUTTON_WIDTH = $extval(GuiSpinnerProperty,"SPIN_BUTTON_WIDTH")
macdef SPIN_BUTTON_PADDING = $extval(GuiSpinnerProperty,"SPIN_BUTTON_PADDING")

abst@ype GuiScrollBarProperty = $extype"GuiScrollBarProperty"

macdef ARROWS_SIZE = $extval(GuiScrollBarProperty,"ARROWS_SIZE")
macdef ARROWS_VISIBLE = $extval(GuiScrollBarProperty,"ARROWS_VISIBLE")
macdef SCROLL_SLIDER_PADDING = $extval(GuiScrollBarProperty,"SCROLL_SLIDER_PADDING")
macdef SCROLL_SLIDER_SIZE = $extval(GuiScrollBarProperty,"SCROLL_SLIDER_SIZE")
macdef SCROLL_PADDING = $extval(GuiScrollBarProperty,"SCROLL_PADDING")
macdef SCROLL_SPEED = $extval(GuiScrollBarProperty,"SCROLL_SPEED")

abst@ype GuiScrollBarSide = $extype"GuiScrollBarSide"

macdef SCROLLBAR_LEFT_SIDE = $extval(GuiScrollBarSide,"SCROLLBAR_LEFT_SIDE")
macdef SCROLLBAR_RIGHT_SIDE = $extval(GuiScrollBarSide,"SCROLLBAR_RIGHT_SIDE")

abst@ype GuiListViewProperty = $extype"GuiListViewProperty"

macdef LIST_ITEMS_HEIGHT = $extval(GuiListViewProperty,"LIST_ITEMS_HEIGHT")
macdef LIST_ITEMS_PADDING = $extval(GuiListViewProperty,"LIST_ITEMS_PADDING")
macdef SCROLLBAR_WIDTH = $extval(GuiListViewProperty,"SCROLLBAR_WIDTH")
macdef SCROLLBAR_SIDE = $extval(GuiListViewProperty,"SCROLLBAR_SIDE")

abst@ype GuiColorPickerProperty = $extype"GuiColorPickerProperty"

macdef COLOR_SELECTOR_SIZE = $extval(GuiColorPickerProperty,"COLOR_SELECTOR_SIZE")
macdef HUEBAR_WIDTH = $extval(GuiColorPickerProperty,"HUEBAR_WIDTH")
macdef HUEBAR_PADDING = $extval(GuiColorPickerProperty,"HUEBAR_PADDING")
macdef HUEBAR_SELECTOR_HEIGHT = $extval(GuiColorPickerProperty,"HUEBAR_SELECTOR_HEIGHT")
macdef HUEBAR_SELECTOR_OVERFLOW = $extval(GuiColorPickerProperty,"HUEBAR_SELECTOR_OVERFLOW")

fun GuiEnable() : void = "mac#"

fun GuiDisable() : void = "mac#"

fun GuiLock() : void = "mac#"

fun GuiUnlock() : void = "mac#"

fun GuiFade(float) : void = "mac#"

fun GuiSetState(int) : void = "mac#"

fun GuiGetState() : int = "mac#"

fun GuiSetFont(Font) : void = "mac#"

fun GuiGetFont() : Font = "mac#"

fun GuiSetStyle(int, int, int) : void = "mac#"

fun GuiGetStyle(int, int) : int = "mac#"

fun GuiEnableTooltip() : void = "mac#"

fun GuiDisableTooltip() : void = "mac#"

fun GuiSetTooltip(cPtr0(char)) : void = "mac#"

fun GuiClearTooltip() : void = "mac#"

fun GuiWindowBox(Rectangle, cPtr0(char)) : bool = "mac#"

fun GuiGroupBox(Rectangle, cPtr0(char)) : void = "mac#"

fun GuiLine(Rectangle, cPtr0(char)) : void = "mac#"

fun GuiPanel(Rectangle) : void = "mac#"

fun GuiScrollPanel(Rectangle, Rectangle, cPtr0(Vector2)) : Rectangle = "mac#"

fun GuiLabel(Rectangle, cPtr0(char)) : void = "mac#"

fun GuiButton(Rectangle, cPtr0(char)) : bool = "mac#"

fun GuiLabelButton(Rectangle, cPtr0(char)) : bool = "mac#"

fun GuiImageButton(Rectangle, cPtr0(char), Texture2D) : bool = "mac#"

fun GuiImageButtonEx(Rectangle, cPtr0(char), Texture2D, Rectangle) : bool = "mac#"

fun GuiToggle(Rectangle, cPtr0(char), bool) : bool = "mac#"

fun GuiToggleGroup(Rectangle, cPtr0(char), int) : int = "mac#"

fun GuiCheckBox(Rectangle, cPtr0(char), bool) : bool = "mac#"

fun GuiComboBox(Rectangle, cPtr0(char), int) : int = "mac#"

fun GuiDropdownBox(Rectangle, cPtr0(char), cPtr0(int), bool) : bool = "mac#"

fun GuiSpinner(Rectangle, cPtr0(char), cPtr0(int), int, int, bool) : bool = "mac#"

fun GuiValueBox(Rectangle, cPtr0(char), cPtr0(int), int, int, bool) : bool = "mac#"

fun GuiTextBox(Rectangle, cPtr0(char), int, bool) : bool = "mac#"

fun GuiTextBoxMulti(Rectangle, cPtr0(char), int, bool) : bool = "mac#"

fun GuiSlider(Rectangle, cPtr0(char), cPtr0(char), float, float, float) : float = "mac#"

fun GuiSliderBar(Rectangle, cPtr0(char), cPtr0(char), float, float, float) : float = "mac#"

fun GuiProgressBar(Rectangle, cPtr0(char), cPtr0(char), float, float, float) : float = "mac#"

fun GuiStatusBar(Rectangle, cPtr0(char)) : void = "mac#"

fun GuiDummyRec(Rectangle, cPtr0(char)) : void = "mac#"

fun GuiScrollBar(Rectangle, int, int, int) : int = "mac#"

fun GuiGrid(Rectangle, float, int) : Vector2 = "mac#"

fun GuiListView(Rectangle, cPtr0(char), cPtr0(int), int) : int = "mac#"

fun GuiListViewEx(Rectangle, cPtr0(cPtr0(char)), int, cPtr0(int), cPtr0(int), int) : int = "mac#"

fun GuiMessageBox(Rectangle, cPtr0(char), cPtr0(char), cPtr0(char)) : int = "mac#"

fun GuiTextInputBox(Rectangle, cPtr0(char), cPtr0(char), cPtr0(char), cPtr0(char)) : int = "mac#"

fun GuiColorPicker(Rectangle, Color) : Color = "mac#"

fun GuiLoadStyle(cPtr0(char)) : void = "mac#"

fun GuiLoadStyleDefault() : void = "mac#"

fun GuiIconText(int, cPtr0(char)) : cPtr0(char) = "mac#"

