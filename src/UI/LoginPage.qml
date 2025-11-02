import QtQuick
import QtQuick.Controls

Window {
    id: view
    width: 390
    height: 800
    visible: true
    title: qsTr("Login Page")
    color: "#fff";

    Loader { // Открыть окно при нажатии "Войти" в btnNext
        id: pageLoader
        anchors.fill: parent
        // source: "qrc:/qt/qml/QML_App/src/UI/MainPage.qml"
    }

    Column{ // Контейнер для всего содержимого
        width: view.width - 40
        anchors.horizontalCenter: parent.horizontalCenter

        Row{ // Фото логин
            topPadding: 10

            Image {
                id: dotsw
                source: "../../imgs/logo_colorful.png"
                fillMode: Image.PreserveAspectFit

                height: 17
            }
        }
        Column{ // Контейнер
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Войдите в свой аккаунт"
                color: "#272727"
                font.pixelSize: 30;
                font.weight: 700
                topPadding: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Введите логин и пароль для входа в свою учетную запись."
                color: "#A9A9A9"
                font.pixelSize: 15;
                font.weight: 400
                topPadding: 15
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Column{
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding: 15
                spacing: 20
                bottomPadding: 15

                Rectangle {
                    id: rectPar
                    width: view.width - 40
                    height: 44
                    radius: 20
                    color: "#F6F6F6"
                    anchors.horizontalCenter: parent.horizontalCenter
                    Row { // TabBar с двумя кнопками
                        anchors.centerIn: parent
                        spacing: 2

                        TabButton {
                            id: loginTab
                            text: "По логину"
                            font.pixelSize: 13;
                            checked: true

                            // Содержимое кнопки
                            contentItem: Text {
                                text: loginTab.text
                                font: loginTab.font
                                anchors.centerIn: parent
                                color: loginTab.down || loginTab.checked ? "#000" : "#A9A9A9"
                                opacity: loginTab.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            // Задний фон
                            background: Rectangle {
                                anchors.fill: parent
                                radius: rectPar.radius
                                color: loginTab.down || loginTab.checked ? "#fff" : "transparent"
                                border.color: "#fff"
                                border.width: 1
                            }

                            width: (rectPar.width / 2) - 2
                            height: rectPar.height - 4

                            // При нажатии меняет контент в TextField
                            onClicked: {
                                console.log("По логину")
                                loginField.placeholderText = "Konstant |"
                                passField.placeholderText = "Введите пароль:"
                            }
                        }

                        TabButton {
                            id: loginTab2
                            text: "По номеру телефона"
                            font.pixelSize: 13;
                            checked: false

                            // Содержимое кнопки
                            contentItem: Text {
                                text: loginTab2.text
                                font: loginTab2.font
                                anchors.centerIn: parent
                                color: loginTab2.down || loginTab2.checked ? "#000" : "#A9A9A9"
                                opacity: loginTab2.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            // Задний фон
                            background: Rectangle {
                                anchors.fill: parent
                                radius: rectPar.radius
                                color: loginTab2.down || loginTab2.checked ? "#fff" : "transparent"
                                border.color: "#fff"
                                border.width: 1
                            }

                            width: (rectPar.width / 2) - 2
                            height: rectPar.height - 4

                            // При нажатии меняет контент в TextField
                            onClicked: {
                                loginField.placeholderText = "+7 (999) 999-99-99"
                                passField.placeholderText = "******"
                            }
                        }
                    } // TabBar с двумя кнопками
                }

            }
            Column{ // Поле для ввода Логина
                padding: 35

                Rectangle{
                    color: "#F6F6F6"
                    radius: rectPar.radius
                    width: view.width - 40

                    TextField {
                        id: loginField
                        width: parent.width
                        height: 56

                        placeholderText: "Konstant |"
                        font.pixelSize: 14;
                        leftPadding: 17
                        verticalAlignment: Text.AlignVCenter
                        inputMethodHints: Qt.ImhDialableCharactersOnly

                        background: Rectangle {
                            anchors.fill: parent
                            radius: rectPar.radius
                            border.color: "#E6E6E6"
                            border.width: 1
                        }

                        // Очистить текст в Field
                        onActiveFocusChanged: {
                            if (activeFocus) {
                                loginField.placeholderText = ""
                            }
                        }

                        // При вводе - кнопка Далее выделяется
                        onTextChanged: {
                            if (loginField.text.length > 1 || passField.text.length > 1) {
                                btnNext.background.color = "#272727"
                            }else{
                                btnNext.background.color = "#E6E6E6"
                                btnNext.text.color = "#B3B3B3"
                            }
                        }
                    }
                }
            } // Поле для ввода Логина

            Column{ // Поле для ввода Пароля
                anchors.horizontalCenter: view.horizontalCenter
                width: view.width - 40

                padding: 20

                Rectangle{

                    color: "#F6F6F6"
                    radius: rectPar.radius

                    TextField {
                        width: view.width - 40
                        height: 56
                        id: passField
                        placeholderText: "Введите пароль: "
                        font.pixelSize: 14;
                        color: "#B3B3B3"
                        echoMode: TextInput.Password
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 17
                        inputMethodHints: Qt.ImhDialableCharactersOnly

                        background: Rectangle {
                            anchors.fill: parent
                            radius: rectPar.radius
                            border.color: "#E6E6E6"
                            border.width: 1
                            color: "#F6F6F6"
                        }

                        // Очистить текст в Field
                        onActiveFocusChanged: {
                            if (activeFocus) {
                                passField.placeholderText = ""
                            }
                        }

                        // При вводе - кнопка Далее выделяется
                        onTextChanged: {
                            if (loginField.text.length > 1 || passField.text.length > 1) {
                                btnNext.background.color = "#272727"
                                btnNext.text.color = "#fff"
                            }else{
                                btnNext.background.color = "#E6E6E6"
                                btnNext.text.color = "#B3B3B3"
                            }
                        }
                    }
                }
            } // Поле для ввода Пароля

            Column{ // Кнопка Войти
                signal openMainWin()
                topPadding: 40
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: btnNext
                    width: 350
                    height: 50
                    background: Rectangle {
                        anchors.fill: parent
                        color: "#E6E6E6"
                        radius: 10

                        Text {
                            text: "Войти"
                            color: "#B3B3B3"
                            font.family: "Verdana"
                            font.pixelSize: 18
                            anchors.centerIn: parent
                        }
                    }

                    // При нажатии - открывает окно MainPage
                    onClicked: {
                        console.log("Button clicked, loading MainPage")
                        pageLoader.source = "qrc:/qt/qml/QML_App/src/UI/MainPage.qml"
                        view.requestToMain()
                    }
                }
            } // Кнопка Войти
            Column{ // Надпись под кнопкой
                topPadding: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    horizontalAlignment: Text.AlignHCenter
                    text: 'Еще нет аккаунта? <b style="color: #000">Зарегистрироваться</b>'
                    textFormat: Text.RichText
                    color: "#B3B3B3"
                }
            } // Надпись под кнопкой
        } // Column - Контейнер
    } // Контейнер для всего содержимого
} // Window
