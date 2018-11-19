#include "translationsmanager.h"
#include <QGuiApplication>

TranslationsManager::TranslationsManager(QObject *parent)
    : QObject{parent}, m_currentTranslator{nullptr} {
  m_enTranslator.load(QLocale{QLocale::English}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_itTranslator.load(QLocale{QLocale::Italian}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_frTranslator.load(QLocale{QLocale::French}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  m_deTranslator.load(QLocale{QLocale::German}, QLatin1String("mysthea"),
                      QLatin1String("_"), QLatin1String(":/translations"));

  setCurrentLanguage(SupportedLanguage::English);
}

void TranslationsManager::setCurrentLanguage(SupportedLanguage language) {
  switch (language) {
  case SupportedLanguage::English: {
    qGuiApp->removeTranslator(m_currentTranslator);
    qGuiApp->installTranslator(&m_enTranslator);
    m_currentTranslator = &m_enTranslator;
    break;
  }

  case SupportedLanguage::Italian: {
    qGuiApp->removeTranslator(m_currentTranslator);
    qGuiApp->installTranslator(&m_itTranslator);
    m_currentTranslator = &m_itTranslator;
    break;
  }

  case SupportedLanguage::French: {
    qGuiApp->removeTranslator(m_currentTranslator);
    qGuiApp->installTranslator(&m_frTranslator);
    m_currentTranslator = &m_frTranslator;
    break;
  }

  case SupportedLanguage::German: {
    qGuiApp->removeTranslator(m_currentTranslator);
    qGuiApp->installTranslator(&m_deTranslator);
    m_currentTranslator = &m_deTranslator;
    break;
  }
  }

  m_currentLanguage = language;
  emit currentLanguageChanged();
}

TranslationsManager::SupportedLanguage TranslationsManager::currentLanguage() {
  return m_currentLanguage;
}
