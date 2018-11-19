#ifndef TRANSLATIONSMANAGER_H
#define TRANSLATIONSMANAGER_H
#include <QLocale>
#include <QTranslator>

class TranslationsManager : public QObject {
  Q_OBJECT
  Q_PROPERTY(SupportedLanguage currentLanguage READ currentLanguage WRITE
                 setCurrentLanguage NOTIFY currentLanguageChanged)
public:
  TranslationsManager(QObject *parent = Q_NULLPTR);

  enum SupportedLanguage {
    English = QLocale::English,
    Italian = QLocale::Italian,
    French = QLocale::French,
    German = QLocale::German
  };
  Q_ENUM(SupportedLanguage)

  SupportedLanguage currentLanguage();

public slots:
  void setCurrentLanguage(SupportedLanguage currentLanguage);

signals:
  void currentLanguageChanged();

private:
  QTranslator m_itTranslator;
  QTranslator m_enTranslator;
  QTranslator m_frTranslator;
  QTranslator m_deTranslator;
  QTranslator *m_currentTranslator;
  SupportedLanguage m_currentLanguage;
};

#endif // TRANSLATIONSMANAGER_H
