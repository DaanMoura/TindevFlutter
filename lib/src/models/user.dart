class Users {
  List<UserModel> _users;

  Users() {
    _users = [];
  }

  Users.fromJson(List<dynamic> parsedJson) {
    int length = parsedJson.length;
    List<UserModel> temp = [];
    for(int i=0; i < length; i++) {
      UserModel user = UserModel(parsedJson[i]);
      temp.add(user);
    }
    _users = temp;
  }

  List<UserModel> get users => _users;
}

class UserModel {
  String _id;
  String _name;
  String _bio;
  String _avatar;

  UserModel(result) {
    _id = result['_id'];
    _name = result['name'];
    _bio = result['bio'];
    _avatar = result['avatar'];
  }

  String get id => _id;
  String get name => _name;
  String get bio => _bio;
  String get avatar => _avatar;
}