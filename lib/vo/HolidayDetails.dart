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
  static final HolidayInfo easterMondayCanada = new HolidayInfo(
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
      "A public holiday celebrated in most of Canada on the first Monday in August.",
      "http://en.wikipedia.org/wiki/Civic_Holiday");
  static final HolidayInfo labourDay = new HolidayInfo(
      "Labour Day",
      "Annual holiday to celebrate the achievements of workers.",
      "https://en.wikipedia.org/wiki/Labour_Day");
  static final HolidayInfo canadaThanksGivingDay = new HolidayInfo(
      "Thanksgiving",
      "Occurring on the second Monday in October, is an annual Canadian holiday which celebrates the harvest and other blessings of the past year.",
      "http://en.wikipedia.org/wiki/Thanksgiving_(Canada)");
  static final HolidayInfo remembranceDay = new HolidayInfo(
      "Remembrance Day",
      "A memorial day observed in Commonwealth countries since the end of World War I to remember the members of their armed forces who have died in the line of duty.",
      "http://en.wikipedia.org/wiki/Remembrance_Day");
  static final HolidayInfo christmasDay = new HolidayInfo(
      "Christmas Day",
      "Annual commemoration of the birth of Jesus Christ.",
      "http://en.wikipedia.org/wiki/Christmas");
  static final HolidayInfo boxingDay = new HolidayInfo(
      "Boxing Day",
      "Boxing Day is a holiday traditionally celebrated the day following Christmas Day.",
      "http://en.wikipedia.org/wiki/Boxing_Day");
  static final HolidayInfo boxingDayCanada = new HolidayInfo(
      "Boxing Day",
      "The first or second weekday after Christmas Day.Observed in Ontario",
      "http://en.wikipedia.org/wiki/Boxing_Day");
  static final HolidayInfo independenceDayUsa = new HolidayInfo(
      "Independence Day",
      "Commemorating the adoption of the Declaration of Independence on July 4, 1776, declaring independence from the Kingdom of Great Britain.",
      "http://en.wikipedia.org/wiki/Independence_Day_(United_States)");
  static final HolidayInfo laborDayUsa = new HolidayInfo(
      "Labor Day",
      "A celebration of the American labor movement and is dedicated to the social and economic achievements of workers.",
      "https://en.wikipedia.org/wiki/Labor_Day");
  static final HolidayInfo colombusDay = new HolidayInfo(
      "Columbus Day",
      "The anniversary of Christopher Columbus' arrival in the Americas, which happened on October 12, 1492.",
      "http://en.wikipedia.org/wiki/Columbus_Day");
  static final HolidayInfo veteransDay = new HolidayInfo(
      "Veterans Day",
      "Honors people who have served in the U.S. Armed Forces, also known as veterans.",
      "http://en.wikipedia.org/wiki/Veterans_Day");
  static final HolidayInfo thanksGivingUsa = new HolidayInfo(
      "Thanksgiving Day",
      "A day of giving thanks for the blessing of the harvest and of the preceding year.",
      "http://en.wikipedia.org/wiki/Thanksgiving");
  static final HolidayInfo australiaDay = new HolidayInfo(
      "Australia Day",
      "The official national day of Australia, celebrated annually on 26 January, which marks the anniversary of the 1788 arrival of the First Fleet of British Ships at Sydney Cove, New South Wales, and raising of the Flag of Great Britain at that site by Governor Arthur Phillip.",
      "https://en.wikipedia.org/wiki/Australia_Day");
  static final HolidayInfo canberraDay = new HolidayInfo(
      "Canberra Day",
      "A public holiday held annually on the second Monday in March in the Australian Capital Territory (ACT) to celebrate the official naming of Canberra. Observed in Australian Capital Territory.",
      "https://en.wikipedia.org/wiki/Canberra_Day");
  static final HolidayInfo easterSaturday = new HolidayInfo(
      "Easter Saturday",
      "Easter Saturday, or Bright Saturday, on the Christian calendar is the Saturday following the festival of Easter, the Saturday of Easter or Bright Week.",
      "https://en.wikipedia.org/wiki/Easter_Saturday");
  static final HolidayInfo easterMondayAus = new HolidayInfo(
      "Easter Monday",
      "Easter Monday in the Roman Catholic liturgical calendar is the second day of the octave of Easter Week and analogously in the Eastern Orthodox Church is the second day of Bright Week.",
      "https://en.wikipedia.org/wiki/Easter_Monday");
  static final HolidayInfo anzacDay = new HolidayInfo(
      "ANZAC Day",
      "A national day of remembrance in Australia and New Zealand that broadly commemorates all Australians and New Zealanders \"who served and died in all wars, conflicts, and peacekeeping operations\" and \"the contribution and suffering of all those who have served.\"",
      "https://en.wikipedia.org/wiki/Anzac_Day");
  static final HolidayInfo queensBirthday = new HolidayInfo(
      "Queens Birthday",
      "The selected day on which the birthday of the monarch of the Commonwealth realms (currently Queen Elizabeth II) is officially celebrated.",
      "https://en.wikipedia.org/wiki/Queen's_Official_Birthday");
  static final HolidayInfo labourDayAus = new HolidayInfo(
      "Labour Day",
      "Annual holiday to celebrate the achievements of workers. Observed in Australian Capital Territory, New South Wales and South Australia.",
      "https://en.wikipedia.org/wiki/Labour_Day");
  static final HolidayInfo easterMondayUk = new HolidayInfo(
      "Easter Monday",
      "Easter Monday in the Roman Catholic liturgical calendar is the second day of the octave of Easter Week and analogously in the Eastern Orthodox Church is the second day of Bright Week. Observed in England, Northern Ireland and Wales.",
      "https://en.wikipedia.org/wiki/Easter_Monday");
  static final HolidayInfo mayDay = new HolidayInfo(
      "May Day Holiday",
      "A traditional spring holiday and coincides with International Workers' Day",
      "http://en.wikipedia.org/wiki/May_Day");
  static final HolidayInfo springBankHoliday = new HolidayInfo(
      "Spring Bank Holiday",
      "Last Monday in May",
      "http://en.wikipedia.org/wiki/Bank_holiday");
  static final HolidayInfo firstSummerBankHoliday = new HolidayInfo(
      "Summer Bank Holiday",
      "First Monday in August. Observed in Scotland.",
      "http://en.wikipedia.org/wiki/Bank_holiday");
  static final HolidayInfo lastSummerBankHoliday = new HolidayInfo(
      "Summer Bank Holiday",
      "Last Monday in August. Observed in England, Northern Ireland and Wales.",
      "http://en.wikipedia.org/wiki/Bank_holiday");
  static final HolidayInfo halloween = new HolidayInfo(
      "Halloween",
      "A yearly celebration on 31 October, the eve of the Western Christian feast of All Hallows' Day",
      "http://en.wikipedia.org/wiki/Halloween");
  static final HolidayInfo guyFawkesDay = new HolidayInfo(
      "Guy Fawkes Day",
      "Guy Fawkes Day, also known as Guy Fawkes Night, Bonfire Night and Firework Night, is an annual commemoration observed on 5 November.",
      "http://en.wikipedia.org/wiki/Guy_Fawkes_Night");

  DateTime holidayDate;
  bool isNextHoliday;
  bool isPast;
  int daysDiff;

  HolidayDetails(HolidayInfo holidayInfo, this.holidayDate)
      : isNextHoliday = false,
        isPast = DateTime.now().isAfter(holidayDate),
        daysDiff = DateTime.now().difference(holidayDate).inDays.abs(),
        super(holidayInfo.holidayName, holidayInfo.holidayDetails,
          holidayInfo.url);

  @override
  String toString() {
    return 'HolidayInfo{holidayName: $holidayName, holidayDetails: $holidayDetails, holidayDate: $holidayDate, isNextHoliday: $isNextHoliday, url: $url, isPast: $isPast, daysDiff: $daysDiff}';
  }
}
