class Client {
  int id;
  String firstName;
  String lastName;
  bool blocked;

  Client({this.id, this.firstName, this.lastName, this.blocked});

  Client.fromMap(Map json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    blocked = json['blocked'] == 1;
  }

  Map toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['blocked'] = blocked;
    return data;
  }
}
