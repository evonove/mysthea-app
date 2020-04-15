#pragma once
#include "typeproxymodel.h"

class IcaionTypeProxyModel : public TypeProxyModel {
  Q_OBJECT
  Q_PROPERTY(bool enableCommand READ enableCommand NOTIFY enableCommandChanged)
public:
  explicit IcaionTypeProxyModel(QObject *parent = nullptr);
  ~IcaionTypeProxyModel();

  Q_INVOKABLE void setTypeFilter(int type) override;
  Q_INVOKABLE void setCommandFilter(int command);
  Q_INVOKABLE virtual void resetFilters() override;

  bool enableCommand() const;

signals:
  void enableCommandChanged();

private:
  int m_command;
};
