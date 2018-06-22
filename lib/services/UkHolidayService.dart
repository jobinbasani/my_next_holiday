import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class UkHolidayService extends HolidayService {
  @override
  String getCountry() {
    return "UK";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addGoodFriday(holidays, year);
    addEasterMonday(holidays, year);
    addMayDay(holidays, year);
    addSpringBankHoliday(holidays, year);
    addChristmasDay(holidays, year);
  }

  void addEasterMonday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.easterMondayUk,
        getEasterDay(year).add(new Duration(days: 1))));
  }

  void addMayDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.mayDay,
        getFirstDayOfWeek(DateTime.may, DateTime.monday, year)));
  }

  void addSpringBankHoliday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.springBankHoliday,
        getLastDayOfWeek(DateTime.may, DateTime.monday, year)));
  }

}
