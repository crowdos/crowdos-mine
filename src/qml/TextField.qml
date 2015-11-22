import QtQuick 2.5
import Crowd.Mine 1.0

// TODO: This is a placeholder for now.
// TODO: placeholder text
// TODO: map all positions
Item {
    signal accepted
    signal editingFinished

    property alias acceptableInput: text.acceptableInput
    property alias autoScroll: text.autoScroll
    property alias canPaste: text.canPaste
    property alias canRedo: text.canRedo
    property alias canUndo: text.canUndo
    property alias color: text.color
    property alias cursorDelegate: text.cursorDelegate
    property alias cursorPosition: text.cursorPosition
    property alias cursorRectangle: text.cursorRectangle
    property alias cursorVisible: text.cursorVisible
    property alias echoMode: text.echoMode
    property alias effectiveHorizontalAlignment: text.effectiveHorizontalAlignment
    property alias font: text.font
    property alias horizontalAlignment: text.horizontalAlignment
    property alias inputMask: text.inputMask
    property alias inputMethodComposing: text.inputMethodComposing
    property alias inputMethodHints: text.inputMethodHints
    property alias length: text.length
    property alias maximumLength: text.maximumLength
    property alias mouseSelectionMode: text.mouseSelectionMode
    property alias passwordCharacter: text.passwordCharacter
    property alias passwordMaskDelay: text.passwordMaskDelay
    property alias persistentSelection: text.persistentSelection
    property alias readOnly: text.readOnly
    property alias renderType: text.renderType
    property alias selectByMouse: text.selectByMouse
    property alias selectedText: text.selectedText
    property alias selectedTextColor: text.selectedTextColor
    property alias selectionColor: text.selectionColor
    property alias selectionEnd: text.selectionEnd
    property alias selectionStart: text.selectionStart
    property alias text: text.text
    property alias validator: text.validator
    property alias verticalAlignment: text.verticalAlignment
    property alias wrapMode: text.wrapMode

    function copy() {
        text.copy()
    }

    function cut() {
        text.cut()
    }

    function deselect() {
        text.deselect()
    }

    function ensureVisible(position) {
        text.ensureVisible(position)
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
    height: Theme.itemSize

    TextInput {
        id: text
        focus: true
        persistentSelection: true
        selectByMouse: true
        wrapMode: TextInput.WordWrap

        onAccepted: parent.accepted()
        onEditingFinished: parent.editingFinished()

        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            rightMargin: Theme.paddingSizeLarge
        }

        font.pixelSize: Theme.fontSize
        color: Theme.textColor
    }
}
