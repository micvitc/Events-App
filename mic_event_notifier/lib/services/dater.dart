// Ex: 1664064000000

class Dater {
  int millis;
  Dater({
    required this.millis,
  });
  // Change to DateTime.fromMillisecondsSinceEpoch(millis);
  DateTime get date => DateTime.fromMillisecondsSinceEpoch(millis);
  // Get date as seconds
  int get dateSeconds => date.millisecondsSinceEpoch ~/ 1000;
  // Get current time as seconds
  int get nowSeconds => DateTime.now().millisecondsSinceEpoch ~/ 1000;
  // Get difference between date and current time in seconds
  int get difference => dateSeconds - nowSeconds;
  // Change to date.day.toString();
  int get day => date.day;
  // Change to date.month.toString();
  int get month => date.month;
  // Change to date.year.toString();
  int get year => date.year;
  // Change to date.hour.toString();
  int get hour => date.hour;
  // Change to date.minute.toString();
  int get minute => date.minute;
  // Change to date.second.toString();
  int get second => date.second;
  // Get AM or PM. True if AM, false if PM.
  bool get am => date.hour < 12;
  // Print day and date in DD MM YYYY hh mm ss format
  // Minute and hour must be 2 digits
  String get dayTime => '$day/$month/$year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get nowDayTime => '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}';
  // ${second.toString().padLeft(2, '0')}';
  // String get dayDate => '$day/$month/$year $hour:$minute';
  // + (am ? "AM" : "PM");

  // Get current date and time and change it to milliseconds
  int get currentMillis => DateTime.now().millisecondsSinceEpoch;

  // Convert given millisecond to mm::ss format
  String milliToTime(int millis) {
    int seconds = (millis / 1000).round();
    int minutes = (seconds / 60).round();
    seconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  String secondsToTime(int seconds) {
    int minutes = (seconds / 60).round();
    seconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

void main(List<String> args) {
  // Change to 1664064000000
  final dater = Dater(millis: 1664064000000);
  print(dater.dayTime);
  print(dater.currentMillis > dater.millis ? 'Past' : 'Future');
  print(dater.difference);
}