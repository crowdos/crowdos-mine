#ifndef DECLARATIVE_DATE_MODEL_H
#define DECLARATIVE_DATE_MODEL_H

#include <QAbstractListModel>
#include <deque>

class DeclarativeDateModel : public QAbstractListModel {
  Q_OBJECT
  Q_PROPERTY(int firstYear READ firstYear WRITE setFirstYear NOTIFY firstYearChanged);
  Q_PROPERTY(int lastYear READ lastYear WRITE setLastYear NOTIFY lastYearChanged);
  Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged);
  Q_PROPERTY(int month READ month NOTIFY monthChanged);
  Q_PROPERTY(int year READ year NOTIFY yearChanged);

public:
  DeclarativeDateModel(QObject *parent = 0);
  ~DeclarativeDateModel();

  void setFirstYear(int firstYear);
  int firstYear() const;

  void setLastYear(int lastYear);
  int lastYear() const;

  void setCurrentIndex(int currentIndex);
  int currentIndex() const;

  void setMonth(int month);
  int month() const;

  void setYear(int year);
  int year() const;

  int rowCount(const QModelIndex& parent = QModelIndex()) const;
  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;
  QHash<int, QByteArray> roleNames() const;

  Q_INVOKABLE int indexForDate(int month, int year);

signals:
  void firstYearChanged();
  void lastYearChanged();
  void currentIndexChanged();
  void monthChanged();
  void yearChanged();

private:
  void recalculate();

  int m_firstYear;
  int m_lastYear;
  int m_currentIndex;
  int m_month;
  int m_year;

  struct DeclarativeDateModelItem {
    bool isCurrentMonth;
    int day;
    int month;
    int year;
  };

  std::deque<DeclarativeDateModelItem> m_items;
};

#endif /* DECLARATIVE_DATE_MODEL_H */
