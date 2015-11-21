#include "declarativedatemodel.h"
#include <QDate>
#include <QQmlInfo>

enum {
  CurrentMonthRole = Qt::UserRole + 1,
  DayRole = Qt::UserRole + 2,
};

DeclarativeDateModel::DeclarativeDateModel(QObject *parent) :
  QAbstractListModel(parent),
  m_firstYear(-1),
  m_lastYear(-1),
  m_currentIndex(-1),
  m_month(-1),
  m_year(-1) {

}

DeclarativeDateModel::~DeclarativeDateModel() {

}

void DeclarativeDateModel::setFirstYear(int firstYear) {
  if (m_firstYear != firstYear) {
    m_firstYear = firstYear;
    emit firstYearChanged();

    recalculate();
  }
}

int DeclarativeDateModel::firstYear() const {
  return m_firstYear;
}

void DeclarativeDateModel::setLastYear(int lastYear) {
  if (m_lastYear != lastYear) {
    m_lastYear = lastYear;
    emit lastYearChanged();

    recalculate();
  }
}

int DeclarativeDateModel::lastYear() const {
  return m_lastYear;
}

void DeclarativeDateModel::setCurrentIndex(int currentIndex) {
  if (m_currentIndex != currentIndex) {
    m_currentIndex = currentIndex;
    emit currentIndexChanged();

    recalculate();
  }
}

int DeclarativeDateModel::currentIndex() const {
  return m_currentIndex;
}

void DeclarativeDateModel::setMonth(int month) {
  if (m_month != month) {
    m_month = month;
    emit monthChanged();
  }
}

int DeclarativeDateModel::month() const {
  return m_month;
}

void DeclarativeDateModel::setYear(int year) {
  if (m_year != year) {
    m_year = year;
    emit yearChanged();
  }
}

int DeclarativeDateModel::year() const {
  return m_year;
}

int DeclarativeDateModel::rowCount(const QModelIndex& parent) const {
  return parent.isValid() ? 0 : m_items.size();
}

QVariant DeclarativeDateModel::data(const QModelIndex& index, int role) const {
  if (index.row() > (int)m_items.size()) {
    return QVariant();
  }

  switch (role) {
  case CurrentMonthRole:
    return m_items[index.row()].isCurrentMonth;

  case DayRole:
    return m_items[index.row()].day;

  default:
    break;
  }

  return QVariant();
}

QHash<int, QByteArray> DeclarativeDateModel::roleNames() const {
  QHash<int, QByteArray> roles;

  roles[CurrentMonthRole] = "currentMonth";
  roles[DayRole] = "day";

  return roles;
}

int DeclarativeDateModel::indexForDate(int month, int year) {
  if (m_firstYear == -1) {
    return -1;
  }

  if (year < m_firstYear) {
    qmlInfo(this) << "Year " << year << " be less than " << m_firstYear;
    return -1;
  }

  if (month < 1 || month > 12) {
    qmlInfo(this) << "Month " << month << " is invalid";
    return -1;
  }

  return (year - m_firstYear) * 12 + month - 1;
}

void DeclarativeDateModel::recalculate() {
  if (m_firstYear == -1 ||
      m_lastYear == -1 ||
      m_currentIndex == -1) {
    return;
  }

  if (m_lastYear <= m_firstYear) {
    qmlInfo(this) << "last year " << m_lastYear << " must be greater than first year " << m_firstYear;
    return;
  }

  int maxIndex = (m_lastYear - m_firstYear + 1) * 12;
  if (m_currentIndex < 0 || m_currentIndex > maxIndex) {
    qmlInfo(this) << "currentIndex " << m_currentIndex << " is not within range 0 to " << maxIndex;
    return;
  }

  int year = m_firstYear + m_currentIndex / 12;

  setYear(year);
  int month = (m_currentIndex % 12) + 1;
  setMonth(month);

  QDate date(DeclarativeDateModel::year(), DeclarativeDateModel::month(), 1);

  int monthDays = date.daysInMonth();
  int previousMonthDaye = date.dayOfWeek();

  std::deque<DeclarativeDateModelItem> items;
  QDate previousDate = date.addDays(-1 * (previousMonthDaye - 1));

  for (int x = 1; x < previousMonthDaye; x++) {
    DeclarativeDateModelItem item;
    item.isCurrentMonth = false;
    item.day = previousDate.day();
    previousDate = previousDate.addDays(1);
    items.push_back(item);
  }

  for (int x = 1; x <= monthDays; x++) {
    DeclarativeDateModelItem item;
    item.isCurrentMonth = true;
    item.day = x;
    date = date.addDays(1);
    items.push_back(item);
  }

  // Fill in the rest of the row:
  // Because date points to the first day of next month
  if (date.dayOfWeek() != 1) {
    for (int x = date.dayOfWeek(); x <= 7; x++) {
      DeclarativeDateModelItem item;
      item.isCurrentMonth = false;
      item.day = date.day();
      date = date.addDays(1);
      items.push_back(item);
    }
  }

  beginResetModel();
  m_items = items;
  endResetModel();
}
