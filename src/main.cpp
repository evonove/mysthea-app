#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#ifdef Q_OS_ANDROID
#include <QtAndroid>
#endif

#ifdef Q_OS_IOS
#include "ios/helpers/nativeidentifier.h"
#endif

#include "models/artworksfiltermodel.h"
#include "models/artworksmodel.h"
#include "models/cardsmodel.h"
#include "models/commandcomboboxmodel.h"
#include "models/typecomboboxmodel.h"
#include "models/typemodel.h"
#include "models/typeproxymodel.h"
#include "translationsmanager.h"

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

  qmlRegisterSingletonType<TranslationsManager>(
      "Translations", 1, 0, "TranslationsManager",
      translations_manager_singletontype_provider);

  qmlRegisterType<ArtworksModel>("Mysthea.Models", 1, 0, "ArtworksModel");
  qmlRegisterType<ArtworksFilterModel>("Mysthea.Models", 1, 0,
                                       "ArtworksFilterModel");
  qmlRegisterType<TypeProxyModel>("Mysthea.Models", 1, 0, "TypeProxyModel");
  qmlRegisterUncreatableType<CardsModel>("Mysthea.Models", 1, 0, "CardsModel",
                                         "CardsModel cannot be created");

  qmlRegisterUncreatableType<CardsProxyModel>(
      "Mysthea.Models", 1, 0, "CardsProxyModel",
      "CardsProxyModel cannot be created");

  qmlRegisterType<TypeComboBoxModel>("Mysthea.Models", 1, 0,
                                     "TypeComboBoxModel");
  qmlRegisterType<CommandComboBoxModel>("Mysthea.Models", 1, 0,
                                        "CommandComboBoxModel");

  bool hasNotch = false;

#ifdef Q_OS_IOS
  hasNotch = iOSHasNotch();
#endif

  engine.rootContext()->setContextProperty("hasNotch", QVariant{hasNotch});

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
