import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: root

    readonly property string quoteText: StoicQuote.data.quote
    readonly property string authorText: StoicQuote.data.author

    implicitWidth: quoteBox.implicitWidth
    implicitHeight: quoteBox.implicitHeight

    // Fetch new quote when component loads
    Component.onCompleted: {
        StoicQuote.getData();
    }

    DropShadow {
        source: quoteBox 
        anchors.fill: quoteBox
        horizontalOffset: 0
        verticalOffset: 2
        radius: 12
        samples: radius * 2 + 1
        color: Appearance.colors.colShadow
        transparentBorder: true
    }
    
    Rectangle {
        id: quoteBox

        implicitWidth: Math.min(600, quoteColumn.implicitWidth + 16 * 2)
        implicitHeight: quoteColumn.implicitHeight + 12 * 2
        radius: Appearance.rounding.small
        color: Appearance.colors.colSecondaryContainer

        Column {
            id: quoteColumn
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: 16
            }
            spacing: 8
            
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 8
                
                MaterialSymbol {
                    id: quoteIcon
                    anchors.top: parent.top
                    iconSize: Appearance.font.pixelSize.huge
                    text: "format_quote"
                    color: Appearance.colors.colOnSecondaryContainer
                }
                StyledText {
                    id: quoteStyledText
                    width: Math.min(500, quoteBox.width - 48)
                    horizontalAlignment: Text.AlignLeft
                    wrapMode: Text.WordWrap
                    text: root.quoteText
                    color: Appearance.colors.colOnSecondaryContainer
                    font {
                        family: Appearance.font.family.reading
                        pixelSize: Appearance.font.pixelSize.large
                        weight: Font.Normal
                    }
                }
            }

            StyledText {
                id: authorText
                anchors.horizontalCenter: parent.horizontalCenter
                text: root.authorText ? `— ${root.authorText}` : ""
                color: Appearance.colors.colOnSecondaryContainer
                font {
                    family: Appearance.font.family.reading
                    pixelSize: Appearance.font.pixelSize.normal
                    weight: Font.Medium
                    italic: true
                }
            }
        }
    }
}
