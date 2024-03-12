class Organization {
  final int? id;
  final String? name;
  final String? schemaName;
  final String? city;
  final String? state;
  final String? country;
  final String? address;
  final String? phone;
  final String? domainUrl;
  final String? adminEmail;
  final bool orgStatus;
  final String? logo;
  final bool isBookmarked;
  final String? description;
  final DateTime? creationDate;

  const Organization({
    this.id,
    this.name,
    this.schemaName,
    this.city,
    this.state,
    this.country,
    this.address,
    this.phone,
    this.domainUrl,
    this.adminEmail,
    this.orgStatus = false,
    this.logo,
    this.isBookmarked = true,
    this.description,
    this.creationDate,
  });

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      id: map['id'],
      name: map['name'],
      schemaName: map['schema_name'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      address: map['address'],
      phone: map['phone'],
      domainUrl: map['domain_url'],
      adminEmail: map['admin_email'],
      orgStatus: map['org_status'],
      logo: map['logo'],
      isBookmarked: map['is_bookmarked'],
      description: map['description'],
      creationDate: map['creation_date'] != null
          ? DateTime.parse(map['creation_date'])
          : null,
    );
  }

  String get wsURL {
    String? url = domainUrl?.replaceAll('https', 'ws').replaceAll('http', 'ws');
    return '$url:8001';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schema_name': schemaName,
      'city': city,
      'state': state,
      'country': country,
      'address': address,
      'phone': phone,
      'domain_url': domainUrl,
      'admin_email': adminEmail,
      'org_status': orgStatus,
      'logo': logo,
      'is_bookmarked': isBookmarked,
      'description': description,
      'creation_date': creationDate?.toIso8601String(),
    };
  }
}
