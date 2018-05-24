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
  }
}
