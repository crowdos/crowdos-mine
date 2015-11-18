#include "declarativestack.h"

DeclarativeStack::DeclarativeStack(QObject *parent) :
  QObject(parent),
  m_cur(0),
  m_prev(0) {

}

DeclarativeStack::~DeclarativeStack() {
  m_items.clear();
}

int DeclarativeStack::size() const {
  return m_items.size();
}

QObject *DeclarativeStack::currentItem() const {
  return m_cur;
}

QObject *DeclarativeStack::previousItem() const {
  return m_prev;
}

QObject *DeclarativeStack::pop() {
  if (size() == 0) {
    return 0;
  } else if (size() == 1) {
    QObject *item = m_items.back();
    m_items.pop_back();
    emit sizeChanged();

    setPreviousItem(0);
    setCurrentItem(0);

    return item;
  }

  QObject *item = m_items.back();
  m_items.pop_back();
  emit sizeChanged();

  setCurrentItem(m_items.back());

  if (m_items.size() > 1) {
    setPreviousItem(m_items[m_items.size() - 2]);
  } else {
    setPreviousItem(0);
  }

  return item;
}

void DeclarativeStack::push(QObject *item) {
  m_items.push_back(item);
  emit sizeChanged();

  setPreviousItem(m_cur);
  setCurrentItem(item);
}

QObject *DeclarativeStack::at(int index) {
  return m_items[index];
}

void DeclarativeStack::setCurrentItem(QObject *item) {
  if (m_cur != item) {
    m_cur = item;
    emit currentItemChanged();
  }
}

void DeclarativeStack::setPreviousItem(QObject *item) {
  if (m_prev != item) {
    m_prev = item;
    emit previousItemChanged();
  }
}
