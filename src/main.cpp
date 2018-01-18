#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#ifdef Q_OS_ANDROID
#include <QtAndroid>
#endif

#include "models/cardsmodel.h"
#include "models/searchmodel.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    auto context = engine.rootContext();

    auto searchModel = new SearchModel();
    searchModel->setSourceModel(new CardsModel);
    context->setContextProperty("cardsModel", searchModel);
    engine.addImportPath(QStringLiteral("qrc:/"));
    engine.addImportPath(QStringLiteral("qrc:/qml/"));
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

#ifdef Q_OS_ANDROID
    QtAndroid::hideSplashScreen();
#endif

    return app.exec();
}
