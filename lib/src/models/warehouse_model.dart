class Warehouse {
  final num? id;
  final Address? address;
  final String? warehouseName;
  final String? contactName;
  final String? email;
  final String? phone;
  final String? altPhone;
  final String? countryCode;
  final bool isMainLocation;

  Warehouse({
    this.id,
    this.address,
    this.warehouseName,
    this.contactName,
    this.email,
    this.phone,
    this.altPhone,
    this.countryCode,
    this.isMainLocation = false,
  });

  factory Warehouse.fromMap(Map<String, dynamic> map) {
    return Warehouse(
      id: map['id'],
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      warehouseName: map['warehouse_name'],
      contactName: map['contact_name'],
      email: map['email'],
      phone: map['phone'],
      altPhone: map['alt_phone'] == 'null' ? null : map['alt_phone'],
      countryCode: map['country_code'],
      isMainLocation: map['is_main_localation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address?.toMap(),
      'warehouse_name': warehouseName,
      'contact_name': contactName,
      'email': email,
      'phone': phone,
      'alt_phone': altPhone,
      'country_code': countryCode,
      'is_main_localation': isMainLocation,
    };
  }
}

class Address {
  final num? id;
  final String? address;
  final String? latitude;
  final String? longitude;

  const Address({
    this.id,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
