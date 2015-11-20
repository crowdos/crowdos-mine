#include "declarativemousegrabdetector.h"
#include <QCoreApplication>
#include <QEvent>
#include <QQuickWindow>

DeclarativeMouseGrabDetector::DeclarativeMouseGrabDetector(QQuickItem *parent) :
  QQuickItem(parent),
  m_currentPage(0),
  m_mouseGrabbed(false) {

}

DeclarativeMouseGrabDetector::~DeclarativeMouseGrabDetector() {
  setCurrentPage(0);
}

void DeclarativeMouseGrabDetector::setCurrentPage(QQuickItem *currentPage) {
  if (m_currentPage == currentPage) {
    return;
  }

  if (m_currentPage) {
    QCoreApplication::instance()->removeEventFilter(this);
  }

  m_currentPage = currentPage;

  if (m_currentPage) {
    QCoreApplication::instance()->installEventFilter(this);
  }

  emit currentPageChanged();
}

QQuickItem *DeclarativeMouseGrabDetector::currentPage() const {
  return m_currentPage;
}

void DeclarativeMouseGrabDetector::setMouseGrabbed(bool grabbed) {
  if (m_mouseGrabbed != grabbed) {
    m_mouseGrabbed = grabbed;
    emit mouseGrabbedChanged();
  }
}

bool DeclarativeMouseGrabDetector::isMouseGrabbed() const {
  return m_mouseGrabbed;
}

bool DeclarativeMouseGrabDetector::eventFilter(QQuickItem *watched, QEvent *event) {
  if (event->type() == QEvent::GrabMouse) {
    if (m_currentPage && window()->mouseGrabberItem() != m_currentPage) {
      setMouseGrabbed(true);
    } else {
      setMouseGrabbed(false);
    }
  } else if (event->type() == QEvent::UngrabMouse) {
    setMouseGrabbed(false);
  }

  return QQuickItem::eventFilter(watched, event);
}
