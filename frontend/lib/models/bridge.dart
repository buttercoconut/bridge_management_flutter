class Bridge {
  final int id;
  final String name;
  final String location;
  final String status;

  Bridge({required this.id, required this.name, required this.location, required this.status});

  factory Bridge.fromJson(Map<String, dynamic> json) {
    return Bridge(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
    );
  }
}
