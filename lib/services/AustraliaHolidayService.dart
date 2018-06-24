import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class AustraliaHolidayService extends HolidayService {
  @override
  String getCountry() {
    return "Australia";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addAustraliaDay(holidays, year);
    addCanberraDay(holidays, year);
    addGoodFriday(holidays, year);
    addEasterSaturday(holidays, year);
    addEasterMonday(holidays, year);
    addAnzacDay(holidays, year);
    addQueensBirthday(holidays, year);
    addLabourDay(holidays, year);
    addChristmasDay(holidays, year);
    addBoxingDay(holidays, year);
  }

  void addAustraliaDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.australiaDay,
        new DateTime.utc(year, DateTime.january, 26)));
  }

  void addCanberraDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.canberraDay,
        getFirstDayOfWeek(DateTime.march, DateTime.monday, year)
            .add(new Duration(days: 7))));
  }

  void addEasterSaturday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.easterSaturday,
        getEasterDay(year).subtract(new Duration(days: 1))));
  }

  void addEasterMonday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.easterMondayAus,
        getEasterDay(year).add(new Duration(days: 1))));
  }

  void addAnzacDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.anzacDay, new DateTime.utc(year, DateTime.april, 25)));
  }

  void addQueensBirthday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.queensBirthday,
        getFirstDayOfWeek(DateTime.june, DateTime.monday, year)
            .add(new Duration(days: 7))));
  }

  void addLabourDay(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(HolidayDetails.labourDayAus,
        getFirstDayOfWeek(DateTime.october, DateTime.monday, year)));
  }

  @override
  String getCountryCode() {
    return "AU";
  }
}
