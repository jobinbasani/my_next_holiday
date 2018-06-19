import 'package:my_next_holiday/services/CommonHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

class UkHolidayService extends CommonHolidayService {
  @override
  String getCountry() {
    return "UK";
  }

  @override
  void loadHolidays(List<HolidayDetails> holidays, int year) {
    addNewYear(holidays, year);
    addGoodFriday(holidays, year);
    addEasterMonday(holidays, year);
    addChristmasDay(holidays, year);
  }

  void addEasterMonday(List<HolidayDetails> holidays, int year) {
    holidays.add(new HolidayDetails(
        HolidayDetails.easterMondayUk,
        getEasterDay(year).add(new Duration(days: 1))));
  }

}
