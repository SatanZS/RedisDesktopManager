import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import "."

ToolBar {
    RowLayout {
        anchors.fill: parent
        Button {
            iconSource: "qrc:/images/add.png"
            text: "Connect to Redis Server"
            Layout.preferredWidth: 230

            onClicked: {
                connectionSettingsDialog.settings = connectionsManager.createEmptyConfig()
                connectionSettingsDialog.open()
            }
        }

        ToolButton {
            iconSource: "qrc:/images/import.png"
            text: "Import Connections"
            tooltip: text

            onClicked: importConnectionsDialog.open()

            FileDialog {
                id: importConnectionsDialog
                title: "Import Connections"
                nameFilters: ["RDM Connections (*.xml *.json)"]
                selectExisting: true
                onAccepted: connectionsManager.importConnections(qmlUtils.getPathFromUrl(fileUrl))
            }
        }

        ToolButton {
            iconSource: "qrc:/images/export.png"
            text: "Export Connections"
            tooltip: text

            onClicked: exportConnectionsDialog.open()

            FileDialog {
                id: exportConnectionsDialog
                title: "Import Connections"
                nameFilters: ["RDM Connections (*.json)"]
                selectExisting: false
                onAccepted: connectionsManager.saveConnectionsConfigToFile(qmlUtils.getPathFromUrl(fileUrl))
            }
        }

        Rectangle { width: 1; color: "lightgrey"; Layout.fillHeight: true;}

        Item { Layout.fillWidth: true }

        Button {
            iconSource: "qrc:/images/settings.png"
            text: "Settings"
        }
    }
}

