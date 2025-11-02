import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: view
    width: 390
    height: 800
    visible: true
    title: qsTr("Main Page")
    color: "#F6F6F6"

    Flickable { // Для слайда экрана вниз
        width: parent.width
        height: parent.height
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds
        contentHeight: 900

        Rectangle { // Контейнер для верхнего блока
            width: parent.width
            height: 200
            color: "#fff"
            anchors.horizontalCenter: parent.horizontalCenter
            bottomLeftRadius: 25
            bottomRightRadius: 25

            Column {
                y: 20
                width: view.width - 40
                height: 36
                anchors.horizontalCenter: parent.horizontalCenter

                Row { // Вертикальное размещение содержимого
                    anchors.verticalCenter: view.verticalCenter

                    Image { // Изображение кабинета пользователя
                        id: cabImg
                        width: 36
                        source: "../../imgs/cabinetIcon.png"
                        fillMode: Image.PreserveAspectFit
                    } // Изображение кабинета пользователя

                    Text { // Надпись в середине
                        leftPadding: 10
                        anchors.verticalCenter: cabImg.verticalCenter
                        text: "Профиль и настройки >"
                        font.weight: 600
                        font.pixelSize: 16
                        color: "#000"
                    } // Надпись в середине
                } // Вертикальное размещение содержимого

                Item { // Отступ между блоками
                    Layout.fillWidth: true
                } // Отступ между блоками

                Rectangle { // Иконка с уведомленями
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.verticalCenter: parent.verticalCenter
                    height: 28
                    width: 28
                    color: "#fff";

                    Image {
                        width: parent.width
                        height: parent.height
                        source: "../../imgs/notificationIcon.png"
                        fillMode: Image.PreserveAspectFit
                    }
                } // Иконка с уведомленями

                Column { // Карточки с постами
                    id: root
                    topPadding: 45

                    Flickable { // Прокрутка карточке по горизотали
                        id: flick_block
                        width: view.width
                        height: 100
                        contentWidth: 470
                        flickableDirection: Flickable.HorizontalFlick
                        boundsBehavior: Flickable.StopAtBounds
                        clip: true

                        Row{ // Выравниваие карточек по горизорнтали
                            spacing: 10
                            Repeater{ // Повторить блоки указонное кол-во раз
                                model: ["../../imgs/tab1.png", "../../imgs/tab2.png", "../../imgs/tab3.png", "../../imgs/tab1.png"]

                                Rectangle{ // Макет карточек
                                    width: 100
                                    height: 100
                                    Image{
                                        width: parent.width
                                        height: parent.height
                                        source: modelData
                                    }
                                } // Макет карточек
                            } // Повторить блоки указонное кол-во раз
                        } // Выравниваие карточек по горизорнтали
                    } // Прокрутка карточке по горизотали

                    Text { // Текст под постами
                        topPadding: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Собрали всю важную информацию в историях"
                        font.pixelSize: 10
                        color: "#B3B3B3"
                    } // Текст под постами
                } // Карточки с постами
            } // Вертикальное размещение содержимого
        } // Контейнер для верхнего блока

        Column { // Контейнер для содержимого
            y: 230
            width: parent.width
            height: 60
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                width: parent.width - 40
                height: parent.height
                color: "#272727"
                radius: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle { // Кнопка "Подключите"
                    width: parent.width - 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    Row { // Размещение материала по вертикали
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 15
                        Text {
                            id: textConnect
                            text: "Подключите"
                            color: "#fff"
                            font.pixelSize: 16
                            font.weight: 600
                        }
                        Image { // Иконка в центре кнопки
                            anchors.verticalCenter: textConnect.verticalCenter
                            width: 115
                            height: 20
                            source: "../../imgs/rosta_prem_icon.png"
                        } // Иконка в центре кнопки
                     } // Размещение материала по вертикали

                    Column { // Кнопка ">"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        Button {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            width: 25
                            height: 25
                            background: Rectangle{
                                width: parent.width
                                height: parent.height
                                radius: width / 2

                                Image{
                                    anchors.centerIn: parent
                                    width: 10
                                    height: 15
                                    source: "../../imgs/arrow.png"
                                }
                            }
                        }
                    }
                } // Кнопка ">"

                Column { // Надпись "Статистика"
                    y: 80
                    width: parent.width
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        text: "Статистика"
                        color: "#272727"
                        font.pixelSize: 30
                        font.weight: 600
                    }
                } // Надпись "Статистика"
                Flickable { // Карусель с табами
                    y: 125
                    width: parent.width + 15
                    height: 45
                    contentWidth: 450
                    flickableDirection: Flickable.HorizontalFlick
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true

                    Row { // Выравнивание табов по-горизонтали
                        id: tabsRow
                        width: parent.width
                        height: parent.height
                        spacing: 10

                        TabButton { // Кнопка "Настройки"
                            id: loginTab
                            width: 45
                            height: parent.height

                            Image {
                                source: "../../imgs/settsIcon.png"
                                width: parent.width - 25
                                height: parent.height - 25
                                anchors.centerIn: parent
                            }
                            checked: false

                            background: Rectangle {
                                color: loginTab.down || loginTab.checked ? "#272727" : "#fff"
                                width: parent.width
                                height: parent.height - 10
                                anchors.centerIn: parent
                                radius: 20
                                border.color: loginTab.down || loginTab.checked ? "#272727" : "#fff"
                                border.width: 1
                            }
                        } // Кнопка "Настройки"

                        TabButton { // Кнопка "Сегодня"
                            id: loginTab2
                            text: "Сегодня"
                            font.pixelSize: 13;

                            width: loginTab2.implicitWidth + 10
                            height: parent.height - 10
                            anchors.verticalCenter: loginTab.verticalCenter
                            checked: true

                            contentItem: Text {
                                text: loginTab2.text
                                font: loginTab2.font
                                color: loginTab2.down || loginTab2.checked ? "#fff" : "#272727"
                                opacity: loginTab2.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            background: Rectangle {
                                width: parent.width
                                height: parent.height
                                anchors.fill: parent
                                radius: 20
                                color: loginTab2.down || loginTab2.checked ? "#272727" : "#fff"
                                border.color: loginTab2.down || loginTab2.checked ? "#272727" : "#fff"
                                border.width: 1
                            }
                        } // Кнопка "Сегодня"

                        TabButton { // Кнопка "Вчера"
                            id: loginTab3
                            text: "Вчера"
                            font.pixelSize: 13;

                            width: loginTab3.implicitWidth + 10
                            height: parent.height - 10
                            anchors.verticalCenter: loginTab.verticalCenter
                            checked: false

                            contentItem: Text {
                                text: loginTab3.text
                                font: loginTab3.font
                                color: loginTab3.down || loginTab3.checked ? "#fff" : "#272727"
                                opacity: loginTab3.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            background: Rectangle {
                                width: parent.width
                                height: parent.height
                                anchors.fill: parent
                                radius: 20
                                color: loginTab3.down || loginTab3.checked ? "#272727" : "#fff"
                                border.color: loginTab3.down || loginTab3.checked ? "#272727" : "#fff"
                                border.width: 1
                            }
                        } // Кнопка "Вчера"

                        TabButton { // Кнопка "С начала недели"
                            id: loginTab4
                            text: "С начала недели"
                            font.pixelSize: 13;

                            width: loginTab4.implicitWidth + 10
                            height: parent.height - 10
                            anchors.verticalCenter: loginTab.verticalCenter
                            checked: false

                            contentItem: Text {
                                text: loginTab4.text
                                font: loginTab4.font
                                color: loginTab4.down || loginTab4.checked ? "#fff" : "#272727"
                                opacity: loginTab4.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            background: Rectangle {
                                width: parent.width
                                height: parent.height
                                anchors.fill: parent
                                radius: 20
                                color: loginTab4.down || loginTab4.checked ? "#272727" : "#fff"
                                border.color: loginTab4.down || loginTab4.checked ? "#272727" : "#fff"
                                border.width: 1
                            }
                        } // Кнопка "С начала недели"

                        TabButton { // Кнопка "С начала месяца"
                            id: loginTab5
                            text: "С начала месяца"
                            font.pixelSize: 13;

                            width: loginTab5.implicitWidth + 10
                            height: parent.height - 10
                            anchors.verticalCenter: loginTab4.verticalCenter
                            checked: false

                            contentItem: Text {
                                text: loginTab5.text
                                font: loginTab5.font
                                color: loginTab5.down || loginTab5.checked ? "#fff" : "#272727"
                                opacity: loginTab5.enabled ? 1.0 : 0.3
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            background: Rectangle {
                                width: parent.width
                                height: parent.height
                                anchors.fill: parent
                                radius: 20
                                color: loginTab5.down || loginTab5.checked ? "#272727" : "#fff"
                                border.color: loginTab5.down || loginTab5.checked ? "#272727" : "#fff"
                                border.width: 1
                            }
                        } // Кнопка "С начала месяца"

                    } // Выравнивание табов по-горизонтали
                } // Карусель с табами

                Column { // Контейнер с карточками
                    topPadding: 180
                    width: parent.width
                    height: 110

                    Text {
                        text: "По всем точкам"
                        color: "#272727"
                        font.pixelSize: 18
                        font.weight: 600
                        bottomPadding: 15
                    }

                    Column { // Контейнер с карточками
                        width: parent.width
                        height: parent.height

                        // Вывести данные в консоль
                        // Component.onCompleted: {
                        //     console.log("a is ", parent.width)
                        // }

                        Rectangle {
                            width: parent.width
                            height: parent.height
                            color: "#fff"
                            radius: 20
                            anchors.verticalCenter: parent.verticalCenter

                            Rectangle { // Карточка "Выручка за день"
                                width: parent.width - 30
                                height: parent.height - 30
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter

                                Row {
                                    width: parent.width
                                    height: parent.height

                                    Text {
                                        text: "Выручка за день"
                                        font.pixelSize: 13
                                        color: "#B3B3B3"
                                    }

                                    Image { // Иконка со стрелкой
                                        width: 15
                                        height: 15

                                        source: "../../imgs/gray_arrow_icon.png"
                                        anchors.right: parent.right
                                    } // Иконка со стрелкой
                                }// Карточка "Выручка за день"

                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    topPadding: 20

                                    Text {
                                        text: "120 000 ₸"
                                        color: "#000"
                                        font.pixelSize: 22
                                    }
                                    Text {
                                        text: "+20 000 ₸ (+20%)"
                                        color: "#62BB43"
                                        font.pixelSize: 15
                                    }
                                }
                            } // Карточка "Выручка за день"
                        }
                    } // Контейнер с карточками

                    Column { // Контейнер с карточками
                        topPadding: 15
                        width: parent.width
                        height: 110

                        Row {
                            width: parent.width
                            height: parent.height
                            Rectangle {
                                width: (parent.width / 2) - 10
                                height: parent.height
                                color: "#fff"
                                radius: 20

                                Rectangle {
                                    width: parent.width - 30
                                    height: parent.height - 30
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Row {
                                        width: parent.width
                                        height: parent.height

                                        Text {
                                            text: "Средний чек1"
                                            font.pixelSize: 13
                                            color: "#B3B3B3"
                                        }

                                        Image {
                                            width: 15
                                            height: 15

                                            source: "../../imgs/gray_arrow_icon.png"
                                            anchors.right: parent.right
                                        }
                                    }

                                    Column {
                                        anchors.verticalCenter: parent.verticalCenter
                                        topPadding: 20

                                        Text {
                                            text: "666₸"
                                            color: "#000"
                                            font.pixelSize: 22
                                        }
                                        Text {
                                            text: "+100₸ (+10%)"
                                            color: "#62BB43"
                                            font.pixelSize: 15
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                width: (parent.width / 2) - 10
                                height: parent.height
                                color: "#fff"
                                radius: 20
                                anchors.right: parent.right

                                Rectangle {
                                    width: parent.width - 30
                                    height: parent.height - 30
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Row {
                                        width: parent.width
                                        height: parent.height

                                        Text {
                                            text: "Количество продаж"
                                            font.pixelSize: 13
                                            color: "#B3B3B3"
                                        }

                                        Image {
                                            width: 15
                                            height: 15

                                            source: "../../imgs/gray_arrow_icon.png"
                                            anchors.right: parent.right
                                        }
                                    }

                                    Column {
                                        anchors.verticalCenter: parent.verticalCenter
                                        topPadding: 20

                                        Text {
                                            text: "3"
                                            color: "#000"
                                            font.pixelSize: 22
                                        }
                                        Text {
                                            text: "-2 (-10%)"
                                            color: "#EE2A29"
                                            font.pixelSize: 15
                                        }
                                    }
                                }
                            }
                        }
                    } // Контейнер с карточками

                    Column { // Контейнер с карточками
                        width: parent.width
                        height: 110
                        topPadding: 30

                        Row {
                            width: parent.width
                            height: parent.height
                            Rectangle {
                                width: (parent.width / 2) - 10
                                height: parent.height
                                color: "#fff"
                                radius: 20

                                Rectangle {
                                    width: parent.width - 30
                                    height: parent.height - 30
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Row {
                                        width: parent.width
                                        height: parent.height
                                        Text {
                                            text: "Прибыль"
                                            font.pixelSize: 13
                                            color: "#B3B3B3"
                                        }

                                        Image {
                                            width: 15
                                            height: 15

                                            source: "../../imgs/gray_arrow_icon.png"
                                            anchors.right: parent.right
                                        }
                                    }

                                    Column {
                                        anchors.verticalCenter: parent.verticalCenter
                                        topPadding: 20
                                        Text {
                                            text: "777₸"
                                            color: "#000"
                                            font.pixelSize: 22
                                        }
                                        Text {
                                            text: "+200₸ (+20%)"
                                            color: "#62BB43"
                                            font.pixelSize: 15
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                width: (parent.width / 2) - 10
                                height: parent.height
                                color: "#fff"
                                radius: 20
                                anchors.right: parent.right

                                Rectangle {
                                    width: parent.width - 30
                                    height: parent.height - 30
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Row {
                                        width: parent.width
                                        height: parent.height
                                        Text {
                                            text: "Себестоимость"
                                            font.pixelSize: 13
                                            color: "#B3B3B3"
                                        }

                                        Image {
                                            width: 15
                                            height: 15

                                            source: "../../imgs/gray_arrow_icon.png"
                                            anchors.right: parent.right
                                        }
                                    }

                                    Column {
                                        anchors.verticalCenter: parent.verticalCenter
                                        topPadding: 20
                                        Text {
                                            text: "13"
                                            color: "#000"
                                            font.pixelSize: 22
                                        }
                                        Text {
                                            text: "14 (-110%)"
                                            color: "#EE2A29"
                                            font.pixelSize: 15
                                        } // Text
                                    } // Column
                                } // Rectangle
                            } // Rectangle
                        } // Row
                    } // Column - Контейнер с карточками
                } // Column - Контейнер с карточками
            } // Column
        } // Column - контейнер для содержимого
    } // Flickable - Для слайда экрана вниз
    Rectangle { // Меню в нижей части экрана
        width: parent.width
        height: 70
        anchors.bottom: parent.bottom
        color: "#fff"
        topLeftRadius: 25
        topRightRadius: 25
        anchors.horizontalCenter: parent.horizontalCenter

        Row { // Выравнивание кнопок по горизонтали
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 15

            spacing: 35

            Column {
                width: textItem1.width
                height: 30

                Image {
                    source: "../../imgs/home_icon.png"
                    width: 20
                    height: 20
                    anchors.horizontalCenter: textItem1.horizontalCenter

                }
                Text {
                    id: textItem1
                    text: "Главная"
                    topPadding: 5
                    font.pointSize: 8
                }
            }
            Column {
                width: textItem2.width
                height: 30

                Image {
                    source: "../../imgs/dir_icon.png"
                    width: 20
                    height: 20
                    anchors.horizontalCenter: textItem2.horizontalCenter

                }
                Text {
                    id: textItem2
                    text: "Справочники"
                    topPadding: 5
                    font.pointSize: 8
                }
            }
            Column {
                width: textItem3.width
                height: 30

                Image {
                    source: "../../imgs/file_icon.png"
                    width: 20
                    height: 20
                    anchors.horizontalCenter: textItem3.horizontalCenter

                }
                Text {
                    id: textItem3
                    text: "Документы"
                    topPadding: 5
                    font.pointSize: 8
                }
            }
            Column {
                width: textItem4.width
                height: 30

                Image {
                    source: "../../imgs/rating_icon.png"
                    width: 20
                    height: 20
                    anchors.horizontalCenter: textItem4.horizontalCenter

                }
                Text {
                    id: textItem4
                    text: "Отчеты"
                    topPadding: 5
                    font.pointSize: 8
                } // Text
            } // Column
        } // Row - Выравнивание кнопок по горизонтали
    } // Rectangle - Меню в нижей части экрана
} // Window
