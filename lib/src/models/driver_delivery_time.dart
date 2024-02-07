import 'package:intl/intl.dart';

class DriverDeliveryTime {
  final DateTime? lastDeliveryTime;
  final DateTime? timeToBackWarehouse;
  final double? distance;

  const DriverDeliveryTime(
      {this.lastDeliveryTime, this.timeToBackWarehouse, this.distance});

  factory DriverDeliveryTime.fromMap(Map<String, dynamic> map) {
    DateFormat format = DateFormat('hh:mm a');

    return DriverDeliveryTime(
      lastDeliveryTime: map['last_delivery_time'] != null
          ? format.parse(map['last_delivery_time'])
          : null,
      timeToBackWarehouse: map['time_to_back_warehouse'] != null
          ? format.parse(map['time_to_back_warehouse'])
          : null,
      distance: map['distance'],
    );
  }

  Map<String, dynamic> toMap() {
    DateFormat format = DateFormat('hh:mm a');
    return {
      'last_delivery_time':
          lastDeliveryTime != null ? format.format(lastDeliveryTime!) : null,
      'time_to_back_warehouse': timeToBackWarehouse != null
          ? format.format(timeToBackWarehouse!)
          : null,
      'distance': distance
    };
  }
}
