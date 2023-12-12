enum Role {
  unknown(id: 0),
  superAdmin(id: 2),
  organizationAdmin(id: 3),
  headDriver(id: 4),
  associateDriver(id: 5);

  final int id;

  const Role({required this.id});
}
