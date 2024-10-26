class Utils {
  Utils._();

  static String formatDurationHourMinute(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    String hoursStr = hours > 0 ? '${hours}h ' : '';
    String minutesStr = minutes > 0 ? '${minutes}m' : '';

    return hoursStr + minutesStr;
  }

}