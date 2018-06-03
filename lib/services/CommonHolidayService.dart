import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

abstract class CommonHolidayService implements HolidayService {
  @override
  List<HolidayDetails> getHolidays(DateTime startDate, DateTime endDate) {
    List<HolidayDetails> holidayList = [];
    int startYear = startDate.year;
    int endYear = endDate.year;
    for (int year = startYear; year <= endYear; year++) {
      print(year);
      loadHolidays(holidayList, year);
    }
    if (holidayList.isNotEmpty) {
      holidayList
          .firstWhere((holidayInfo) => !holidayInfo.isPast)
          .isNextHoliday = true;
    }
    return holidayList
        .where((holidayInfo) =>
            holidayInfo.holidayDate.isAfter(startDate) &&
            holidayInfo.holidayDate.isBefore(endDate))
        .toList();
  }

  void loadHolidays(List<HolidayDetails> holidays, int year);

  void addNewYear(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.newYear, new DateTime(year, DateTime.january, 1)));
  }

  void addGoodFriday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.goodFriday,
        getEasterDay(year).subtract(new Duration(days: 2))));
  }

  void addEasterMonday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.easterMonday,
        getEasterDay(year).add(new Duration(days: 1))));
  }

  void addChristmasDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.christmasDay,
        new DateTime(year, DateTime.december, 25)));
  }

  DateTime getFirstDayOfWeek(int month, int week, int year) {
    DateTime calculatedDay = new DateTime(year, month, 1);
    while (calculatedDay.weekday != week) {
      calculatedDay = calculatedDay.add(new Duration(days: 1));
    }
    return calculatedDay;
  }

  DateTime getLastDayOfWeek(int month, int week, int year) {
    DateTime calculatedDay = getLastDayOfMonth(month, year);
    while (calculatedDay.weekday != week) {
      calculatedDay = calculatedDay.subtract(new Duration(days: 1));
    }
    return calculatedDay;
  }

  DateTime getLastDayOfMonth(int month, int year) {
    return (month < 12)
        ? new DateTime(year, month + 1, 0)
        : new DateTime(year + 1, 1, 0);
  }

  DateTime getEasterDay(int year) {
    int a = year % 19;
    int b = year ~/ 100;
    int c = year % 100;
    int d = (b ~/ 4);
    int e = b % 4;
    int f = ((b + 8) ~/ 25);
    int g = ((b - f + 1) ~/ 3);
    int h = (19 * a + b - d - g + 15) % 30;
    int i = (c ~/ 4);
    int k = c % 4;
    int l = (32 + 2 * e + 2 * i - h - k) % 7;
    int m = ((a + 11 * h + 22 * l) ~/ 451);
    int n = ((h + l - 7 * m + 114) ~/ 31);
    int p = (h + l - 7 * m + 114) % 31;

    return new DateTime(year, n, p + 1);
  }
}
