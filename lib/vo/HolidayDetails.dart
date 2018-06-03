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
  static final HolidayInfo martinLutherDay = new HolidayInfo(
      "Martin Luther King, Jr. Day",
      "An American federal holiday marking the birthday of Martin Luther King, Jr. It is observed on the third Monday of January each year, which is around the time of King's birthday, January 15.",
      "http://en.wikipedia.org/wiki/Martin_Luther_King,_Jr._Day");
  static final HolidayInfo presidentsDay = new HolidayInfo(
      "Washington's Birthday",
      "A United States federal holiday celebrated on the third Monday of February in honor of George Washington, the first President of the United States.",
      "http://en.wikipedia.org/wiki/Washington's_Birthday");
  static final HolidayInfo memorialDay = new HolidayInfo(
      "Memorial Day",
      "A day of remembering the men and women who died while serving in the United States Armed Forces.",
      "http://en.wikipedia.org/wiki/Memorial_Day");
  static final HolidayInfo victoriaDay = new HolidayInfo(
      "Victoria Day",
      "A federal Canadian public holiday celebrated on the last Monday before May 25, in honour of Queen Victoria's birthday.",
      "http://en.wikipedia.org/wiki/Victoria_Day");
  static final HolidayInfo canadaDay = new HolidayInfo(
      "Canada Day",
      "National day of Canada, celebrating the anniversary of the July 1, 1867, enactment of the British North America Act, 1867.",
      "http://en.wikipedia.org/wiki/Canada_Day");
  static final HolidayInfo civicHoliday = new HolidayInfo(
      "Civic Holiday",
      "A public holiday celebrated in most of Canada on the first Monday in August",
      "http://en.wikipedia.org/wiki/Civic_Holiday");

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
