import 'package:my_next_holiday/vo/HolidayDetails.dart';


abstract class HolidayService{
  String getCountry();
  List<HolidayDetails> getHolidays(DateTime startDate, DateTime endDate);
}