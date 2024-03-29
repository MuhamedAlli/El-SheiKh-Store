import 'package:elsheikh_store/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orDoubleZero() {
    if (this == null) {
      return Constants.doubleZero;
    } else {
      return this!;
    }
  }
}
