import QtQuick 2.5
import Crowd.Mine 1.0

// TODO: This is a placeholder for now.
// TODO: placeholder text
// TODO: map all positions
Item {
    signal linkActivated(string link)
    signal linkHovered(string link)

    property alias baseUrl: text.baseUrl
    property alias canPaste: text.canPaste
    property alias canRedo: text.canRedo
    property alias canUndo: text.canUndo
    property alias color: text.color
    property alias cursorDelegate: text.cursorDelegate
    property alias cursorPosition: text.cursorPosition
    property alias cursorRectangle: text.cursorRectangle
    property alias cursorVisible: text.cursorVisible
    property alias effectiveHorizontalAlignment: text.effectiveHorizontalAlignment
    property alias font: text.font
    property alias horizontalAlignment: text.horizontalAlignment
    property alias hoveredLink: text.hoveredLink
    property alias inputMethodComposing: text.inputMethodComposing
    property alias inputMethodHints: text.inputMethodHints
    property alias length: text.length
    property alias lineCount: text.lineCount
    property alias mouseSelectionMode: text.mouseSelectionMode
    property alias persistentSelection: text.persistentSelection
    property alias readOnly: text.readOnly
    property alias renderType: text.renderType
    property alias selectByKeyboard: text.selectByKeyboard
    property alias selectByMouse: text.selectByMouse
    property alias selectedText: text.selectedText
    property alias selectedTextColor: text.selectedTextColor
    property alias selectionColor: text.selectionColor
    property alias selectionEnd: text.selectionEnd
    property alias selectionStart: text.selectionStart
    property alias text: text.text
    property alias textDocument: text.textDocument
    property alias textFormat: text.textFormat
    property alias textMargin: text.textMargin
    property alias verticalAlignment: text.verticalAlignment
    property alias wrapMode: text.wrapMode

    function append(textString) {
        text.append(textString)
    }

    function copy() {
        text.copy()
    }

    function cut() {
        text.cut()
    }

    function deselect() {
        text.deselect()
    }

    function getFormattedText(start, end) {
        return text.getFormattedText(start, end)
    }

    function getText(start, end) {
        return text.getText(start, end)
    }

    function insert(position, textString) {
        text.insert(position, textString)
    }

    function isRightToLeft(start, end) {
        return text.isRightToLeft(start, end)
    }

    function linkAt(x, y) {
        return text.linkAt(x, y)
    }

    function moveCursorSelection(position, mode) {
        text.moveCursorSelection(position, mode)
    }

    function paste() {
        text.paste()
    }

    function positionAt(x, y, position) {
        return text.positionAt(x, y, position)
    }

    function positionToRectangle(pos) {
        return text.positionToRectangle(pos)
    }

    function redo() {
        text.redo()
    }

    function remove(start, end) {
        text.remove(start, end)
    }

    function select(start, end) {
        text.select(start, end)
    }

    function selectAll() {
        text.selectAll()
    }

    function selectWord() {
        text.selectWord()
    }

    function undo() {
        text.undo()
    }

    width: Screen.width
    height: Screen.width

    TextEdit {
        id: text
        focus: true
        persistentSelection: true
        selectByMouse: true
        wrapMode: TextInput.WordWrap

        onLinkActivated: parent.linkActivated(link)
        onLinkHovered: parent.linkHovered(link)

        anchors.fill: parent

        font.pixelSize: Theme.fontSize
        color: Theme.textColor
    }
}
