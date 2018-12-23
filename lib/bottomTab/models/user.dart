// https://github.com/NPKompleet/Beatz/blob/master/lib/models/album.dart

class User {
  static const String FIRST_NAME = 'firstName';
  static const String LAST_NAME = 'lastName';
  static const String POSITION = 'position';
  static const String EMAIL = 'email';
  static const String PHONE = 'phone';
  static const String TOKEN = 'token';
  static const String LOADING = 'loading';
  static const String LOADED = 'loaded';

  String firstName;
  String lastName;
  String position;
  String email;
  String phone;
  String token;
  String status;

  User({this.token, this.status});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json[FIRST_NAME];
    lastName = json[LAST_NAME];
    position = json[POSITION];
    email = json[EMAIL];
    phone = json[PHONE];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[FIRST_NAME] = this.firstName;
    data[LAST_NAME] = this.lastName;
    data[POSITION] = this.position;
    data[EMAIL] = this.email;
    data[PHONE] = this.phone;
    return data;
  }
}
