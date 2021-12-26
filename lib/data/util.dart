class Utils {

  static int getFormatTime( DateTime date ) {
    return int.parse( '${date.year}${makeTwoDigit(date.month)}${makeTwoDigit(date.day)}' );
  }

  static DateTime getFormatDateTime( int date ) {
    final _date = date.toString();
    final year = _date.substring( 0, 4 );
    final month = _date.substring( 4, 6 );
    final day = _date.substring( 6, 8 );
    return DateTime( 
      int.parse(year),
      int.parse(month),
      int.parse(day) );
  }

  static String makeTwoDigit( int num ) {
    return num.toString().padLeft( 2, '0' );
  }
}