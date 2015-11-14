#ifndef DECLARATIVE_PLUGIN_H
#define DECLARATIVE_PLUGIN_H

#include <QQmlExtensionPlugin>

class DeclarativePlugin : public QQmlExtensionPlugin {
  Q_OBJECT
  Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
  DeclarativePlugin(QObject *parent = 0);
  void registerTypes(const char *uri);
  void initializeEngine(QQmlEngine *engine, const char *uri);
};

#endif /* DECLARATIVE_PLUGIN_H */
