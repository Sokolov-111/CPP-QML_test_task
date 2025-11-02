cmake_minimum_required(VERSION 3.16)

project(QML_App VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appQML_App
    src/main.cpp
)

qt_add_qml_module(appQML_App
    URI QML_App
    VERSION 1.0
    SOURCES
    src/main.cpp

    QML_FILES
    src/UI/Intro.qml
    src/UI/ScreenList.qml
    QML_FILES
    QML_FILES src/UI/LoginPage.qml
    QML_FILES src/UI/MainPage.qml
    RESOURCES imgs/arrow.png imgs/cabinetIcon.png imgs/dir_icon.png imgs/file_icon.png imgs/gray_arrow_icon.png imgs/home_icon.png imgs/img1.png imgs/img2.png imgs/img3.png imgs/logo.png imgs/logo_colorful.png imgs/notificationIcon.png imgs/rating_icon.png imgs/rosta_prem_icon.png imgs/settsIcon.png imgs/tab1.png imgs/tab2.png imgs/tab3.png
    RESOURCES qml.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQML_App PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQML_App
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQML_App
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQML_App
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
