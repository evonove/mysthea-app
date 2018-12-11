#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#ifdef Q_OS_ANDROID
#include <QtAndroid>
#endif

#include "models/cardsmodel.h"
#include "models/typemodel.h"
#include "models/typeproxymodel.h"
#include "translationsmanager.h"

static QObject *
translations_manager_singletontype_provider(QQmlEngine *engine,
                                            QJSEngine *scriptEngine) {
  Q_UNUSED(engine)
  Q_UNUSED(scriptEngine)

  return new TranslationsManager();
}

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  TranslationsManager translationsManager;

  QObject::connect(&translationsManager, SIGNAL(currentLanguageChanged()),
                   &engine, SLOT(retranslate()));

  qmlRegisterSingletonType<TranslationsManager>(
      "Translations", 1, 0, "TranslationsManager",
      translations_manager_singletontype_provider);

  auto typeProxyModel = new TypeProxyModel();
  typeProxyModel->setSourceModel(new TypeModel);
  qmlRegisterType<TypeProxyModel>("Mysthea.Models", 1, 0, "TypeProxyModel");

  qmlRegisterUncreatableType<CardsModel>("Mysthea.Models", 1, 0, "CardsModel",
                                         "CardsModel cannot be created");

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
