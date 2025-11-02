#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTimer>
#include <QObject>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QTimer* timer = new QTimer();
    timer -> setInterval(2000);

    QQmlApplicationEngine* engine = new QQmlApplicationEngine;
    QObject::connect(
        engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );

    engine->loadFromModule("QML_App", "Intro");

    QTimer::singleShot(
        2000,
        [&engine]() {
            const auto rootObjects = engine->rootObjects();
            for (QObject* obj : rootObjects)
            {
                obj->deleteLater();
            }

            engine->loadFromModule("QML_App", "ScreenList");
        });


    timer->setInterval(8000);
    timer->setSingleShot(true);
    timer->start();
    QObject::connect(timer,
                    &QTimer::timeout,
                    [&engine](){
                        const auto rootObjects = engine->rootObjects();
                        for (QObject* obj : rootObjects)
                        {
                            obj->deleteLater();
                        }

                        engine->loadFromModule("QML_App", "LoginPage");
                    });
    return app.exec();
}
