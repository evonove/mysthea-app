#pragma once
#include "typeproxymodel.h"

class TheFallTypeProxyModel : public TypeProxyModel {
  Q_OBJECT

public:
  explicit TheFallTypeProxyModel(QObject *parent = nullptr);
  ~TheFallTypeProxyModel();

  Q_INVOKABLE void setTypeFilter(int type) override;
};
