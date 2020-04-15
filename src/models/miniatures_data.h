#pragma once

#include <QList>
#include <QMetaType>
#include <QString>

/*
 * Games:
 * 1 - Mysthea
 * 2 - Icaion
 * 3 - TheFall
 */
struct Miniature {
  int game;
  QString name;
  QString image;
};

Q_DECLARE_METATYPE(Miniature)

// clang-format off
const QVector<Miniature> miniatures_data = {
    // Game: MYSTHEA
    {1, "Telron",           "qrc:/assets/images/extras/miniatures/mysthea/mini_telron.jpg"},
    {1, "Anuth",            "qrc:/assets/images/extras/miniatures/mysthea/mini_anuth.jpg"},
    {1, "Celethe",          "qrc:/assets/images/extras/miniatures/mysthea/mini_celethe.jpg"},
    {1, "Leheir",           "qrc:/assets/images/extras/miniatures/mysthea/mini_leheir.jpg"},
    {1, "Sanya",            "qrc:/assets/images/extras/miniatures/mysthea/mini_sanya.jpg"},
    {1, "Kolbor & Malabor", "qrc:/assets/images/extras/miniatures/mysthea/mini_kolbormalabor.jpg"},
    {1, "CR-2T1",           "qrc:/assets/images/extras/miniatures/mysthea/mini_cr.jpg"},
};
// clang-format on
