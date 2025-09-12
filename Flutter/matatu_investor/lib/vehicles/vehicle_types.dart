
enum Vehicle_type {
  /// <remarks/>
  _x0031_4_Seater,

  /// <remarks/>
  _x0033_3_Seater,

  /// <remarks/>
  _x0032_5_Seater,

  /// <remarks/>
  _x0032_9_Seater,

  /// <remarks/>
  _41_Seater,

  /// <remarks/>
  _26_Seater,

  /// <remarks/>
  _37_Seater,
}

extension vehicle_types on Vehicle_type {
  String get value {
    switch (this) {
      case Vehicle_type._26_Seater:
        return "26 seater";
      case Vehicle_type._37_Seater:
        return "37 seater";
      case Vehicle_type._41_Seater:
        return "41 seater";
      case Vehicle_type._x0032_5_Seater:
        return "25 seater";
      case Vehicle_type._x0032_9_Seater:
        return "29 seater";
      case Vehicle_type._x0033_3_Seater:
        return "33 seater";
      case Vehicle_type._x0031_4_Seater:
        return "14 seater";
      default:
        return "";
    }
  }
}

enum vehicle_Status {
  /// <remarks/>
  Active,

  /// <remarks/>
  Dormant,

  /// <remarks/>
  Left,
}

extension vehicle_status on vehicle_Status {
  String get value {
    switch (this) {
      case vehicle_Status.Active:
        return "Active";
      case vehicle_Status.Dormant:
        return "Dormant";
      case vehicle_Status.Left:
        return "Left";

      default:
        return "";
    }
  }
}
