class HolidayInfo {
  String holidayName;
  String holidayDetails;
  String url;

  HolidayInfo(this.holidayName, this.holidayDetails, this.url);
}

class HolidayDetails extends HolidayInfo {
  static final HolidayInfo newYear = new HolidayInfo(
      "New Year’s Day",
      "The first day of the year on the modern Gregorian calendar as well as the Julian calendar used in the Roman Empire since 45 BC.",
      "http://en.wikipedia.org/wiki/New_Year's_Day");
  static final HolidayInfo familyDayBc = new HolidayInfo(
      "Family Day(BC)",
      "A statutory holiday occurring on second Monday in February observed in BC.",
      "http://en.wikipedia.org/wiki/Family_Day_(Canada)");
  static final HolidayInfo familyDay = new HolidayInfo(
      "Family Day",
      "Observed on the third Monday of February in the provinces of AB, MB, ON, NS, PEI, and SK. In the provinces of MB, NS, and PEI, the holiday is instead termed Louis Riel Day, Nova Scotia Heritage Day, and Islander Day respectively.",
      "http://en.wikipedia.org/wiki/Family_Day_(Canada)");
  static final HolidayInfo goodFriday = new HolidayInfo(
      "Good Friday",
      "Good Friday is a religious holiday, observed primarily by Christians, commemorating the crucifixion of Jesus Christ and his death at Calvary.",
      "http://en.wikipedia.org/wiki/Good_Friday");
  static final HolidayInfo easterMonday = new HolidayInfo(
      "Easter Monday",
      "Easter Monday is the day after Easter Sunday and is celebrated as a holiday in some largely Christian cultures, especially Catholic and Eastern Christian cultures. Observed in Quebec.",
      "http://en.wikipedia.org/wiki/Easter_Monday");
  static final HolidayInfo temp = new HolidayInfo(
      "Temp",
      "Observed in Quebec.",
      "http:");

  DateTime holidayDate;
  bool isNextHoliday;
  bool isPast;
  int daysDiff;

  HolidayDetails(HolidayInfo holidayInfo, this.holidayDate)
      : super(holidayInfo.holidayName, holidayInfo.holidayDetails,
            holidayInfo.url) {
    DateTime now = new DateTime.now();
    Duration difference = now.difference(holidayDate);
    isPast = now.isAfter(holidayDate);
    daysDiff = difference.inDays.abs();
    isNextHoliday = false;
  }

  @override
  String toString() {
    return 'HolidayInfo{holidayName: $holidayName, holidayDetails: $holidayDetails, holidayDate: $holidayDate, isNextHoliday: $isNextHoliday, url: $url, isPast: $isPast, daysDiff: $daysDiff}';
  }
}
