import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class UsaHolidayService extends HolidayService {
  @override
  String getCountry() {
    return "USA";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addMartinLutherDay(holidays, year);
    addPresidentsDay(holidays, year);
    addMemorialDay(holidays, year);
    addIndependenceDay(holidays, year);
    addLaborDay(holidays, year);
    addColombusDay(holidays, year);
    addVeteransDay(holidays, year);
    addThanksgivingDay(holidays, year);
    addChristmasDay(holidays, year);
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

  void addMemorialDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.memorialDay,
        getLastDayOfWeek(DateTime.may, DateTime.monday, year)));
  }

  void addIndependenceDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.independenceDayUsa,
        new DateTime(year, DateTime.july, 4)));
  }

  void addLaborDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.laborDayUsa,
        getFirstDayOfWeek(DateTime.september, DateTime.monday, year)));
  }

  void addColombusDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.colombusDay,
        getFirstDayOfWeek(DateTime.october, DateTime.monday, year)
            .add(new Duration(days: 7))));
  }

  void addVeteransDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.veteransDay, new DateTime(year, DateTime.november, 11)));
  }

  void addThanksgivingDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.thanksGivingUsa,
        getFirstDayOfWeek(DateTime.november, DateTime.thursday, year)
            .add(new Duration(days: 21))));
  }

  @override
  String getCountryCode() {
    return "US";
  }
}
