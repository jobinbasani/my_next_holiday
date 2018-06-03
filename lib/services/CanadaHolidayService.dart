import 'package:my_next_holiday/services/CommonHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class CanadaHolidayService extends CommonHolidayService {
  @override
  String getCountry() {
    return "Canada";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addFamilyDayBc(holidays, year);
    addFamilyDay(holidays, year);
    addGoodFriday(holidays, year);
    addEasterMonday(holidays, year);
    addVictoriaDay(holidays, year);
    addCanadaDay(holidays, year);
    addCivicHoliday(holidays, year);
    addLabourDay(holidays, year);
    addThanksGivingDay(holidays, year);
    addRemembranceDay(holidays, year);
    addChristmasDay(holidays, year);
    addBoxingDay(holidays, year);
  }

  void addFamilyDayBc(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.familyDayBc,
        getFirstDayOfWeek(DateTime.february, DateTime.monday, year)
            .add(new Duration(days: 7))));
  }

  void addFamilyDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.familyDay,
        getFirstDayOfWeek(DateTime.february, DateTime.monday, year)
            .add(new Duration(days: 14))));
  }

  void addVictoriaDay(List<HolidayDetails> holidays, int year) {
    DateTime calculatedDay = new DateTime(year, DateTime.may, 24);
    while (calculatedDay.weekday != DateTime.monday) {
      calculatedDay = calculatedDay.subtract(new Duration(days: 1));
    }
    holidays.add(new HolidayDetails(HolidayDetails.victoriaDay, calculatedDay));
  }

  void addCanadaDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.canadaDay, new DateTime(year, DateTime.july, 1)));
  }

  void addCivicHoliday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.civicHoliday,
        getFirstDayOfWeek(DateTime.august, DateTime.monday, year)));
  }

  void addLabourDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.labourDay,
        getFirstDayOfWeek(DateTime.september, DateTime.monday, year)));
  }

  void addThanksGivingDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.canadaThanksGivingDay,
        getFirstDayOfWeek(DateTime.october, DateTime.monday, year)
            .add(new Duration(days: 7))));
  }

  void addRemembranceDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.remembranceDay,
        new DateTime(year, DateTime.november, 11)));
  }

  void addBoxingDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.boxingDayCanada,
        new DateTime(year, DateTime.december, 26)));
  }
}
