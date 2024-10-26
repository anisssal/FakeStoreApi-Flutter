import 'package:intl/intl.dart';

class MyDateUtils {
  MyDateUtils._();

  static final DateFormat dFormatHHmm = DateFormat('HH:mm');
  static final DateFormat dFormatMMMdd = DateFormat('MMM dd');
  static final DateFormat dFomatEEEMMMddyyyy = DateFormat('EEE, MMM dd, yyyy');
  static final DateFormat dFormatddMMMyyyyy = DateFormat('dd MMM yyyy');
  static final DateFormat dFormatMMMddyyyy = DateFormat('MMM dd, yyyy');

  static String formatHHmm(DateTime dateTime){
    return dFormatHHmm.format(dateTime);
  }

  static String formatMMMdd(DateTime dateTime){
    return dFormatMMMdd.format(dateTime);
  }
  static String formatEEEMMMddyyyy(DateTime dateTime){
    return dFomatEEEMMMddyyyy.format(dateTime);
  }
  static String formatDDMMMyyyy(DateTime dateTime){
    return dFormatddMMMyyyyy.format(dateTime);
  }
  static String formatMMMddyyyy(DateTime dateTime){
    return dFormatMMMddyyyy.format(dateTime);
  }

  static DateTime parseDateFromApi(String date){
    final year = date.substring(0,4);
    final month = date.substring(4,6);
    final day = date.substring(6,8);
    final hour = date.substring(8,10);
    final minutes = date.substring(10,12);
    final second = date.substring(12);
    return DateTime(int.parse(year),int.parse(month),int.parse(day), int.parse(hour),int.parse(minutes),int.parse(second) );
  }

  static String formatHotelCheckInOutDate(DateTime checkInDate, DateTime checkOutDate) {
    DateFormat formatter = DateFormat('MMM d');
    String checkInFormatted = formatter.format(checkInDate);
    String checkOutFormatted = formatter.format(checkOutDate);

    String year = DateFormat('yyyy').format(checkInDate);

    return '$checkInFormatted - $checkOutFormatted, $year';
  }
}