import 'package:goonline_app/consts/enums.dart';

DateTime intToDate(int dateFromDatabase) {
  final date = DateTime.fromMillisecondsSinceEpoch(dateFromDatabase);
  return date;
}

int prioToInt(Prio prio) {
  switch (prio) {
    case Prio.low:
      return 1;
    case Prio.medium:
      return 2;
    case Prio.high:
      return 3;
    default:
      return 0;
  }
}

Prio intToPrio(int prioNumber) {
  switch (prioNumber) {
    case 1:
      return Prio.low;
    case 2:
      return Prio.medium;
    case 3:
      return Prio.high;
    default:
      return Prio.low;
  }
}
