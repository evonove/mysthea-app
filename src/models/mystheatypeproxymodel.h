#pragma once
#include "typeproxymodel.h"

class MystheaTypeProxyModel : public TypeProxyModel {
  Q_OBJECT
  Q_PROPERTY(bool enableCommand READ enableCommand NOTIFY enableCommandChanged)
public:
  explicit MystheaTypeProxyModel(QObject *parent = nullptr);
  ~MystheaTypeProxyModel();

  Q_INVOKABLE void setTypeFilter(int type) override;
  Q_INVOKABLE void setCommandFilter(int command);
  Q_INVOKABLE virtual void resetFilters() override;

  bool enableCommand() const;

signals:
  void enableCommandChanged();

private:
  int m_command;
};
