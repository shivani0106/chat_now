/// uid : "1"
/// fristName : "1"
/// lastName : "Καλωσήρθατε"
/// password : "123456"
/// image : "20 λεπτά"
/// phone : 123456789

class UserMaster {
  String? _uid;
  String? _fullName;
  String? _password;
  String? _image;
  String? _email;
  int? _phone;

  String? get uid => _uid;
  String? get fullName => _fullName;

  set uid(String? value) {
    _uid = value;
  }

  String? get password => _password;
  String? get image => _image;
  int? get phone => _phone;
  String? get email => _email;

  UserMaster(
      {String? uid,
      String? fullName,
      String? password,
      String? email,
      String? image,
      int? phone}) {
    _uid = uid;
    _fullName = fullName;
    _password = password;
    _image = image;
    _phone = phone;
    _email = email;
  }

  UserMaster.fromJson(dynamic json) {
    _uid = json['uid'];
    _fullName = json['fullName'];
    _password = json['password'];
    _password = json['email'];
    _image = json['image'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['uid'] = _uid;
    map['fullName'] = _fullName;
    map['password'] = _password;
    map['image'] = _image;
    map['phone'] = _phone;
    map['email'] = _email;
    return map;
  }

  set fullName(String? value) {
    _fullName = value;
  }

  set password(String? value) {
    _password = value;
  }

  set image(String? value) {
    _image = value;
  }

  set phone(int? value) {
    _phone = value;
  }

  set email(String? value) {
    _email = value;
  }
}
