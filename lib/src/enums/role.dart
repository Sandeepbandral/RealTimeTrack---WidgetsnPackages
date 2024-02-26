enum Role {
  unknown(id: 0, name: ''),
  superAdmin(id: 1, name: 'Super Admin'),
  organizationAdmin(id: 2, name: 'Organization Admin'),
  headDriver(id: 3, name: 'Head Driver'),
  associateDriver(id: 4, name: 'Associate Driver'),
  customer(id: 5, name: 'Customer');

  final int id;
  final String name;

  const Role({required this.id, required this.name});
}
