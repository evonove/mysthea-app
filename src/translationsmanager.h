#ifndef TRANSLATIONSMANAGER_H
#define TRANSLATIONSMANAGER_H
#include <QLocale>
#include <QTranslator>
#include <QSettings>

class TranslationsManager : public QObject {
  Q_OBJECT
  Q_PROPERTY(SupportedLanguage currentLanguage READ currentLanguage WRITE
                 setCurrentLanguage NOTIFY currentLanguageChanged)
public:
  TranslationsManager(QObject *parent = Q_NULLPTR);

  enum SupportedLanguage {
    English = QLocale::English,
    French = QLocale::French,
    Spanish = QLocale::Spanish,
    German = QLocale::German,
    Italian = QLocale::Italian,
    Japanese = QLocale::Japanese
  };
  Q_ENUM(SupportedLanguage)

  SupportedLanguage currentLanguage() const;

public slots:
  void setCurrentLanguage(SupportedLanguage currentLanguage);

signals:
  void currentLanguageChanged();

private:
  QTranslator m_enTranslator;
  QTranslator m_frTranslator;
  QTranslator m_esTranslator;
  QTranslator m_deTranslator;
  QTranslator m_itTranslator;
  QTranslator m_jaTranslator;
  QTranslator *m_currentTranslator;
  SupportedLanguage m_currentLanguage;

  QSettings m_settings;
};

#endif // TRANSLATIONSMANAGER_H
