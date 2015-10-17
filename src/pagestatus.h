#ifndef PAGE_STATUS_H
#define PAGE_STATUS_H

#include <QObject>

class PageStatus : public QObject {
  Q_OBJECT
  Q_ENUMS(Status);

public:
  enum Status {
    Inactive,
    Activating,
    Active,
    Deactivating,
  };

  PageStatus(QObject *parent = 0) : QObject(parent) {}
};

#endif /* PAGE_STATUS_H */
