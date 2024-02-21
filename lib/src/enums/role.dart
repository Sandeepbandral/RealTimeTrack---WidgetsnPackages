enum Role {
  unknown(id: 0),
  superAdmin(id: 1),
  organizationAdmin(id: 2),
  headDriver(id: 3),
  associateDriver(id: 4),
  customer(id: 5);

  final int id;

  const Role({required this.id});
}
