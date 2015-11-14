#include <QGuiApplication>
#include <QQuickView>
#include <QUrl>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);
  QQuickView view;

  view.setResizeMode(QQuickView::SizeRootObjectToView);

  QUrl url("/usr/share/minedemo/qml/main.qml");
  if (app.arguments().size() > 1) {
    url = QString("%1/main.qml").arg(app.arguments()[1]);
  }

  view.setSource(url);

  view.show();

  return app.exec();
}
