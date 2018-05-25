class NlwUtils{
  static String getMonth(DateTime dateTime){
    switch(dateTime.month){
      case 1:
        return "JAN";
        break;
      case 2:
        return "FEB";
        break;
      case 3:
        return "MAR";
        break;
      case 4:
        return "APR";
        break;
      case 5:
        return "MAY";
        break;
      case 6:
        return "JUN";
        break;
      case 7:
        return "JUL";
        break;
      case 8:
        return "AUG";
        break;
      case 9:
        return "SEP";
        break;
      case 10:
        return "OCT";
        break;
      case 11:
        return "NOV";
        break;
      case 12:
        return "DEC";
        break;
      default:
        return "";
    }
  }
  static getDay(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return "SUN";
        break;
      case 2:
        return "MON";
        break;
      case 3:
        return "TUE";
        break;
      case 4:
        return "WED";
        break;
      case 5:
        return "THU";
        break;
      case 6:
        return "FRI";
        break;
      case 7:
        return "SAT";
        break;
      default:
        return "";
    }
  }
}