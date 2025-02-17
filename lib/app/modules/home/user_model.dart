class User {
  String? id;
  String? name;
  String? createAt;

  User({this.id, this.name, this.createAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createAt'] = createAt;
    return data;
  }
}
