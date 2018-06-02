import 'package:my_next_holiday/services/CommonHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class UsaHolidayService extends CommonHolidayService {
  @override
  String getCountry() {
    return "USA";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addMartinLutherDay(holidays, year);
    addPresidentsDay(holidays, year);
  }

  void addMartinLutherDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.martinLutherDay,
        getFirstDayOfWeek(DateTime.january, DateTime.monday, year)
            .add(new Duration(days: 14))));
  }

  void addPresidentsDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.presidentsDay,
        getFirstDayOfWeek(DateTime.february, DateTime.monday, year)
            .add(new Duration(days: 14))));
  }
}
