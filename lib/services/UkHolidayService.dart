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
    addFirstSummerBankHoliday(holidays, year);
    addLastSummerBankHoliday(holidays, year);
    addHalloweenDay(holidays, year);
    addGuyFawkesDay(holidays, year);
    addChristmasDay(holidays, year);
    addBoxingDay(holidays, year);
  }

  void addEasterMonday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.easterMondayUk,
        getEasterDay(year).add(new Duration(days: 1))));
  }

  void addMayDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.mayDay,
        getFirstDayOfWeek(DateTime.may, DateTime.monday, year)));
  }

  void addSpringBankHoliday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.springBankHoliday,
        getLastDayOfWeek(DateTime.may, DateTime.monday, year)));
  }

  void addFirstSummerBankHoliday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.firstSummerBankHoliday,
        getFirstDayOfWeek(DateTime.august, DateTime.monday, year)));
  }

  void addLastSummerBankHoliday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.lastSummerBankHoliday,
        getLastDayOfWeek(DateTime.august, DateTime.monday, year)));
  }

  void addHalloweenDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.halloween, new DateTime(year, DateTime.october, 31)));
  }

  void addGuyFawkesDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.guyFawkesDay, new DateTime(year, DateTime.november, 5)));
  }
}
