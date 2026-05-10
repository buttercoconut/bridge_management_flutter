class Bridge {
  final int id;
  final String name;
  final String location;
  final String condition;

  Bridge({required this.id, required this.name, required this.location, required this.condition});

  factory Bridge.fromJson(Map<String, dynamic> json) {
    return Bridge(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      condition: json['condition'],
    );
  }
}
