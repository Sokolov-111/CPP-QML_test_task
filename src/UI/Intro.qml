import QtQuick
import QtQuick.Layouts

Window {
    width: 390
    height: 800
    visible: true
    title: qsTr("ROSTA")
    color: "#272727";

    Column{ // Контейнер для всего содержимого
        anchors.centerIn: parent

        Row{
            anchors.centerIn: parent

            Image { // Лого в центре
                id: dots
                source: "../../imgs/logo.png"
                fillMode: Image.PreserveAspectFit

                height: 42
            }
        }
    } // Контейнер для всего содержимого
} // Window
