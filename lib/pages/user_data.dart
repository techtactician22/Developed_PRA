
class UserData {
  static final UserData _instance = UserData._internal();
  
  String? email;
  String? username;

  factory UserData() {
    return _instance;
  }

  UserData._internal();
}
