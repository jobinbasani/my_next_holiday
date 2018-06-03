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
}
