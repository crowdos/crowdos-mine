#ifndef DECLARATIVE_MOUSE_GRAB_DETECTOR_H
#define DECLARATIVE_MOUSE_GRAB_DETECTOR_H

#include <QQuickItem>

class DeclarativeMouseGrabDetector : public QQuickItem {
  Q_OBJECT
  Q_PROPERTY(QQuickItem *currentPage READ currentPage WRITE setCurrentPage NOTIFY currentPageChanged);
  Q_PROPERTY(bool mouseGrabbed READ isMouseGrabbed NOTIFY mouseGrabbedChanged);

public:
  DeclarativeMouseGrabDetector(QQuickItem *parent = 0);
  ~DeclarativeMouseGrabDetector();

  void setCurrentPage(QQuickItem *currentPage);
  QQuickItem *currentPage() const;

  void setMouseGrabbed(bool grabbed);
  bool isMouseGrabbed() const;

protected:
  bool eventFilter(QQuickItem *watched, QEvent *event);

signals:
  void currentPageChanged();
  void mouseGrabbedChanged();

private:
  QQuickItem *m_currentPage;
  bool m_mouseGrabbed;
};

#endif /* DECLARATIVE_MOUSE_GRAB_DETECTOR_H */
