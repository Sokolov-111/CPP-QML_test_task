import QtQuick
import QtQuick.Controls

Window {
    id: main_win
    width: 390
    height: 800
    visible: true
    title: qsTr("News Page")

    SwipeView { // Слайдер
         id: view
         anchors.fill: parent
         focus: true

         Page { // Контейнер для карточки
             background: Rectangle {
                 color: "#272727"
             }
             Row { // Колонка для табов
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top
                 topPadding: 10
                 spacing: 10

                 Repeater { // Повторить табы сколько есть карточек
                     model: view.count
                     Rectangle {
                         width: (main_win.width / 3) - 20
                         height: 4
                         radius: 2
                         color: index === view.currentIndex ? "#FFFFFF" : "#505050"

                         Connections { // При слайде карточки - отметить таб
                             target: view
                             onCurrentIndexChanged: {
                                 color = index === view.currentIndex ? "#FFFFFF" : "#505050"
                             }
                         }
                     }
                 } // Повторить табы сколько есть карточек
             } // Колонка для табов

             Column { // Контейнер с содержимым карточки
                 anchors.horizontalCenter: parent.horizontalCenter

                 Row{ // Лого по центру
                     topPadding: 40
                     anchors.horizontalCenter: parent.horizontalCenter
                     Image {
                         id: dotsw
                         source: "../../imgs/logo.png"
                         fillMode: Image.PreserveAspectFit

                         height: 17
                     }
                 } // Лого по центру
                 Column { // Фото в центре
                     topPadding: 40

                     Image {
                         id: image
                         source: "../../imgs/img1.png"
                         width: main_win.width
                         height: 370
                     }
                 } // Фото в центре

                 Rectangle { // Контент под фотографией
                     width: main_win.width
                     height: 480
                     color: "#fff"

                     Column{ // Контейнер для содержимого
                         anchors.horizontalCenter: parent.horizontalCenter

                         Text{
                             anchors.horizontalCenter: parent.horizontalCenter
                             text: "Технология для развития\n торговли и общепита."
                             color: "#272727"
                             font.pixelSize: 28;
                             font.weight: 600
                             topPadding: 25
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                        }

                        Text{
                             anchors.horizontalCenter: parent.horizontalCenter
                             text: "Полный учёт и контроль для магазинов, бутиков, кафе и ресторанов. Управляйте кассами, складами, сотрудниками и выручкой в одном приложении."
                             color: "#B3B3B3"
                             font.pixelSize: 15;
                             font.weight: 500
                             topPadding: 10
                             width: parent.width
                             wrapMode: Text.WordWrap
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                        }
                     } // Контейнер для содержимого

                     Column { // Кнопки
                         topPadding: 40

                         anchors.centerIn: parent
                         spacing: 20

                         Button { // Кнопка Далее
                             width: 350
                             height: 50
                             background: Rectangle {
                                 anchors.fill: parent
                                 color: "#272727"
                                 radius: 10

                                 Text {
                                     text: "Далее"
                                     color: "#fff"
                                     font.family: "Verdana"
                                     font.pixelSize: 18
                                     anchors.centerIn: parent
                                 }
                             }
                         } // Кнопка Далее

                         Button { // Кнопка Пропустить
                             width: 350
                             height: 20
                             background: Rectangle {
                                 anchors.fill: parent
                                 radius: 10

                                 Text {
                                     text: "Пропустить"
                                     color: "#B3B3B3"
                                     font.family: "Verdana"
                                     font.pixelSize: 18
                                     anchors.centerIn: parent
                                 }
                             }
                         } // Кнопка Пропустить
                     } // Кнопки
                 } // Контент под фотографией
             } // Контейнер с содержимым карточки
         }

         Page { // Контейнер для карточки
             background: Rectangle {
                 color: "#F6F6F6"
             }
             Row { // Колонка для табов
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top
                 topPadding: 10
                 spacing: 10


                 Repeater { // Повторить табы сколько есть карточек
                     model: view.count
                     Rectangle {
                         width: (main_win.width / 3) - 20
                         height: 4
                         radius: 2
                         color: index === view.currentIndex ? "#272727" : "#E6E6E6"

                         Connections {
                             target: view
                             onCurrentIndexChanged: {
                                 color = index === view.currentIndex ? "#272727" : "#E6E6E6"
                             }
                         }
                     }
                 } // Повторить табы сколько есть карточек
             } // Колонка для табов

             Column{ // Контейнер с содержимым карточки
                 anchors.horizontalCenter: parent.horizontalCenter

                 Row{ // Лого по центру
                     topPadding: 40
                     anchors.horizontalCenter: parent.horizontalCenter
                     Image {
                         source: "../../imgs/logo.png"
                         fillMode: Image.PreserveAspectFit

                         height: 17
                     }
                 } // Лого по центру

                 Column{ // Фото в центре
                     topPadding: 40

                     Image {
                         source: "../../imgs/img2.png"
                         width: main_win.width
                         height: 370
                     }
                 } // Фото в центре

                 Rectangle{ // Контент под фотографией
                     width: main_win.width
                     height: 480
                     color: "#fff"
                     Column { // Контейнер для содержимого
                         anchors.horizontalCenter: parent.horizontalCenter

                         Text{
                             anchors.horizontalCenter: parent.horizontalCenter
                             text: "Документы, которые\n сразу всё объясняют"
                             color: "#272727"
                             font.pixelSize: 28;
                             font.weight: 600
                             topPadding: 30
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                        }

                        Text{
                             anchors.horizontalCenter: parent.horizontalCenter
                             text: "Поступления, списания и продажи — не просто списком. Всё чётко, понятно и готово к принятию решений."
                             color: "#B3B3B3"
                             font.pixelSize: 15;
                             font.weight: 500
                             topPadding: 15
                             width: parent.width
                             wrapMode: Text.WordWrap
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                        }
                     } // Контейнер для содержимого

                     Column{ // Кнопки
                         topPadding: 40

                         anchors.centerIn: parent
                         spacing: 20

                         Button { // Кнопка Далее
                             width: 350
                             height: 50
                             background: Rectangle {
                                 anchors.fill: parent
                                 color: "#272727"
                                 radius: 10

                                 Text {
                                     text: "Далее"
                                     color: "#fff"
                                     font.family: "Verdana"
                                     font.pixelSize: 18
                                     anchors.centerIn: parent
                                 }
                             }
                         } // Кнопка Далее

                         Button { // Кнопка Пропустить
                             width: 350
                             height: 20
                             background: Rectangle {
                                 anchors.fill: parent
                                 radius: 10

                                 Text {
                                     text: "Пропустить"
                                     color: "#B3B3B3"
                                     font.family: "Verdana"
                                     font.pixelSize: 18
                                     anchors.centerIn: parent
                                 }
                             }
                         } // Кнопка Пропустить
                     }
                 }
             }
         }

         Page { // Контейнер для карточки
                 background: Rectangle {
                 color: "#F6F6F6"
             }
             Row { // Колонка для табов
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top
                 topPadding: 10
                 spacing: 10

                 Repeater { // Повторить табы сколько есть карточек
                     model: view.count
                     Rectangle {
                         width: (main_win.width / 3) - 20
                         height: 4
                         radius: 2
                         color: index === view.currentIndex ? "#272727" : "#E6E6E6"

                         Connections {
                             target: view
                             onCurrentIndexChanged: {
                                 color = index === view.currentIndex ? "#272727" : "#E6E6E6"
                             }
                         }
                     }
                 } // Повторить табы сколько есть карточек
             } // Колонка для табов

             Column { // Контейнер с содержимым карточки
                topPadding: 40
                anchors.horizontalCenter: parent.horizontalCenter

                  Row{ // Лого по центру
                      anchors.horizontalCenter: parent.horizontalCenter
                      Image {
                          source: "../../imgs/logo.png"
                          fillMode: Image.PreserveAspectFit

                          height: 17
                      }
                  } // Лого по центру

                  Column{ // Фото в центре
                      topPadding: 40
                      Image {
                          source: "../../imgs/img2.png"
                          width: main_win.width
                          height: 370
                      }
                  } // Фото в центре

                  Rectangle { // Контент под фотографией
                      width: main_win.width
                      height: 480
                      color: "#fff"

                      Column { // Контейнер для содержимого
                          anchors.horizontalCenter: parent.horizontalCenter

                          Text {
                              anchors.horizontalCenter: parent.horizontalCenter
                              text: "Подробные отчеты и\n аналитика товаров"
                              color: "#272727"
                              font.pixelSize: 28;
                              font.weight: 600
                              topPadding: 30
                              horizontalAlignment: Text.AlignHCenter
                              verticalAlignment: Text.AlignVCenter
                          }

                          Text {
                              anchors.horizontalCenter: parent.horizontalCenter
                              text: "Аналитика по товарам и категориям — не просто цифры. Видно, что растёт, что падает, где брать пример, а что менять. Все данные — в одном месте."
                              color: "#B3B3B3"
                              font.pixelSize: 15;
                              font.weight: 500
                              topPadding: 15
                              width: parent.width
                              wrapMode: Text.WordWrap
                              horizontalAlignment: Text.AlignHCenter
                              verticalAlignment: Text.AlignVCenter
                          }
                      } // Контейнер для содержимого
                      Column { // Кнопки
                          topPadding: 40

                          anchors.centerIn: parent
                          spacing: 20

                          Button { // Кнопка Далее
                          width: 350
                          height: 50
                          background: Rectangle {
                                  anchors.fill: parent
                                  color: "#272727"
                                  radius: 10

                                  Text {
                                      text: "Далее"
                                      color: "#fff"
                                      font.family: "Verdana"
                                      font.pixelSize: 18
                                      anchors.centerIn: parent
                                  }
                              }
                          } // Кнопка Далее

                      Button { // Кнопка Пропустить
                          width: 350
                          height: 20
                          background: Rectangle {
                              anchors.fill: parent
                              radius: 10

                              Text {
                                  text: "Пропустить"
                                  color: "#B3B3B3"
                                  font.family: "Verdana"
                                  font.pixelSize: 18
                                  anchors.centerIn: parent
                              }
                          }
                      } // Кнопка Пропустить
                  } // Кнопки
              } // Контент под фотографией
           } // Контейнер с содержимым карточки
        }  // Контейнер для карточки
    } // Слайдер
} // Window
