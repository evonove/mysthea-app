#ifndef TRANSLATIONSMANAGER_H
#define TRANSLATIONSMANAGER_H
#include <QLocale>
#include <QTranslator>

class TranslationsManager : public QObject {
  Q_OBJECT
  Q_PROPERTY(SupportedLanguage currentLanguage READ currentLanguage WRITE
                 setCurrentLanguage NOTIFY currentLanguageChanged)
  Q_PROPERTY(QString currentLanguageText READ currentLanguageText NOTIFY
                 currentLanguageChanged)
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
  QString currentLanguageText() const;

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
  QString m_currentLanguageText;
};

#endif // TRANSLATIONSMANAGER_H
