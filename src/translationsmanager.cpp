#include "translationsmanager.h"
#include <QGuiApplication>

TranslationsManager::TranslationsManager(QObject *parent)
    : QObject{parent}, m_currentTranslator{nullptr} {
  m_enTranslator.load(QLocale{QLocale::English}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_frTranslator.load(QLocale{QLocale::French}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_esTranslator.load(QLocale{QLocale::Spanish}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_deTranslator.load(QLocale{QLocale::German}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_itTranslator.load(QLocale{QLocale::Italian}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_jaTranslator.load(QLocale{QLocale::Japanese}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  setCurrentLanguage(SupportedLanguage::English);
}

void TranslationsManager::setCurrentLanguage(SupportedLanguage language) {
  if (language == m_currentLanguage) {
    return;
  } else {
    qGuiApp->removeTranslator(m_currentTranslator);

    switch (language) {
    case SupportedLanguage::English: {
      qGuiApp->installTranslator(&m_enTranslator);
      m_currentTranslator = &m_enTranslator;
      m_currentLanguageText = "English";
      break;
    }
    case SupportedLanguage::French: {
      qGuiApp->installTranslator(&m_frTranslator);
      m_currentTranslator = &m_frTranslator;
      m_currentLanguageText = "Français";
      break;
    }
    case SupportedLanguage::Spanish: {
      qGuiApp->installTranslator(&m_esTranslator);
      m_currentTranslator = &m_esTranslator;
      m_currentLanguageText = "Español";
      break;
    }

    case SupportedLanguage::German: {
      qGuiApp->installTranslator(&m_deTranslator);
      m_currentTranslator = &m_deTranslator;
      m_currentLanguageText = "Duitse";
      break;
    }
    case SupportedLanguage::Italian: {
      qGuiApp->installTranslator(&m_itTranslator);
      m_currentTranslator = &m_itTranslator;
      m_currentLanguageText = "Italiano";
      break;
    }

    case SupportedLanguage::Japanese: {
      qGuiApp->installTranslator(&m_jaTranslator);
      m_currentTranslator = &m_jaTranslator;
      m_currentLanguageText = "日本人";
      break;
    }
    }

    m_currentLanguage = language;
    emit currentLanguageChanged();
  }
}

TranslationsManager::SupportedLanguage
TranslationsManager::currentLanguage() const {
  return m_currentLanguage;
}

QString TranslationsManager::currentLanguageText() const {
  return m_currentLanguageText;
}
