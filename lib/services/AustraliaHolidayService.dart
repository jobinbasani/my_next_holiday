import 'package:my_next_holiday/services/CommonHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class AustraliaHolidayService extends CommonHolidayService {
  @override
  String getCountry() {
    return "Australia";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addAustraliaDay(holidays, year);
    addCanberraDay(holidays, year);
    addChristmasDay(holidays, year);
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
}
