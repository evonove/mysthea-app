#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#ifdef Q_OS_ANDROID
#include <QtAndroid>
#endif

#include "models/artworksfiltermodel.h"
#include "models/artworksmodel.h"
#include "models/cardsmodel.h"
#include "models/commandcomboboxmodel.h"
#include "models/icaiontypeproxymodel.h"
#include "models/miniaturesfiltermodel.h"
#include "models/miniaturesmodel.h"
#include "models/mystheatypeproxymodel.h"
#include "models/thefalltypeproxymodel.h"
#include "models/typecomboboxmodel.h"
#include "models/typemodel.h"
#include "models/typeproxymodel.h"
#include "translationsmanager.h"
#include "system.h"

static QObject *
system_manager_singletontype_provider(QQmlEngine *engine,
                                      QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    auto system = new System();
    return system;
}

static QObject *
translations_manager_singletontype_provider(QQmlEngine *engine,
                                            QJSEngine *scriptEngine) {
  Q_UNUSED(scriptEngine)
  auto translationsManager = new TranslationsManager();

  QObject::connect(translationsManager, SIGNAL(currentLanguageChanged()),
                   engine, SLOT(retranslate()));

  return translationsManager;
}

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QCoreApplication::setApplicationName("Mysthea");
  QCoreApplication::setOrganizationName("Tabula Game");

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  qmlRegisterSingletonType<System>(
      "System", 1, 0, "System",
      system_manager_singletontype_provider);

  qmlRegisterSingletonType<TranslationsManager>(
      "Translations", 1, 0, "TranslationsManager",
      translations_manager_singletontype_provider);

  qmlRegisterType<ArtworksModel>("Mysthea.Models", 1, 0, "ArtworksModel");
  qmlRegisterType<ArtworksFilterModel>("Mysthea.Models", 1, 0,
                                       "ArtworksFilterModel");
  qmlRegisterType<MiniaturesModel>("Mysthea.Models", 1, 0, "MiniaturesModel");
  qmlRegisterType<MiniaturesFilterModel>("Mysthea.Models", 1, 0,
                                         "MiniaturesFilterModel");

  qmlRegisterUncreatableType<TypeProxyModel>(
      "MystheaUniverse.Models", 1, 0, "TypeProxyModel",
      "TypeProxyModel cannot be created");

  qmlRegisterType<MystheaTypeProxyModel>("Mysthea.Models", 1, 0,
                                         "MystheaTypeProxyModel");

  qmlRegisterType<IcaionTypeProxyModel>("Icaion.Models", 1, 0,
                                        "IcaionTypeProxyModel");

  qmlRegisterType<TheFallTypeProxyModel>("TheFall.Models", 1, 0,
                                         "TheFallTypeProxyModel");

  qmlRegisterUncreatableType<CardsModel>("Mysthea.Models", 1, 0, "CardsModel",
                                         "CardsModel cannot be created");

  qmlRegisterUncreatableType<CardsProxyModel>(
      "MystheaUniverse.Models", 1, 0, "CardsProxyModel",
      "CardsProxyModel cannot be created");

  qmlRegisterType<TypeComboBoxModel>("MystheaUniverse.Models", 1, 0,
                                     "TypeComboBoxModel");
  qmlRegisterType<CommandComboBoxModel>("MystheaUniverse.Models", 1, 0,
                                        "CommandComboBoxModel");

  engine.addImportPath(QStringLiteral("qrc:/"));
  engine.addImportPath(QStringLiteral("qrc:/qml/"));
  engine.addImportPath(QStringLiteral("qrc:/style/"));
  engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

#ifdef Q_OS_ANDROID
  QtAndroid::hideSplashScreen();
#endif
  return app.exec();
}
