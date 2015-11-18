#ifndef DECLARATIVE_STACK_H
#define DECLARATIVE_STACK_H

#include <QObject>
#include <deque>

class DeclarativeStack : public QObject {
  Q_OBJECT

  Q_PROPERTY(int size READ size NOTIFY sizeChanged);
  Q_PROPERTY(QObject *currentItem READ currentItem NOTIFY currentItemChanged);
  Q_PROPERTY(QObject *previousItem READ previousItem NOTIFY previousItemChanged);

public:
  DeclarativeStack(QObject *parent = 0);
  ~DeclarativeStack();

  int size() const;

  QObject *currentItem() const;
  void setCurrentItem(QObject *item);

  QObject *previousItem() const;
  void setPreviousItem(QObject *item);

  Q_INVOKABLE QObject *pop();
  Q_INVOKABLE QObject *at(int index);

public slots:
  void push(QObject *item);

signals:
  void sizeChanged();
  void currentItemChanged();
  void previousItemChanged();

private:
  std::deque<QObject *> m_items;
  QObject *m_cur, *m_prev;
};

#endif /* DECLARATIVE_STACK_H */
