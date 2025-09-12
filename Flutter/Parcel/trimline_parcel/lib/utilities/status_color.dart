import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trimline_parcel/models/parcel_model.dart';

Color GetStatusColor(ParcelStatus status) {
    switch (status) {
      case ParcelStatus.delivered:
        return Colors.green;
      case ParcelStatus.inTransit:
        return Colors.blue;
      case ParcelStatus.outForDelivery:
        return Colors.orange;
      case ParcelStatus.failed:
        return Colors.red;
      case ParcelStatus.returned:
        return Colors.purple;
      case ParcelStatus.pending:
        return Colors.grey;
    }
  }