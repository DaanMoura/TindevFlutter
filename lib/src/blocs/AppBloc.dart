import 'dart:convert';

import 'package:app_tindev/src/models/user.dart';
import 'package:app_tindev/src/services/api_provider.dart';
import 'package:app_tindev/src/services/repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class BaseController extends BlocBase {
  final _repository = Repository();
  final ApiProvider api = ApiProvider();

  Users users;
  String loggedUser = "";

  var _usersController = BehaviorSubject.seeded(Users());
  Stream<Users> get outUsers => _usersController.stream;
  Sink<Users> get inUsers => _usersController.sink;

  var _loggedUserController = BehaviorSubject.seeded("");
  Stream<String> get outLoggedUser => _loggedUserController.stream;
  Sink<String> get inLoggedUser => _loggedUserController.sink;

  void setUsers(Users usersParam) {
    users = usersParam;
    inUsers.add(_usersController.value = users);
  }

  void fetchUsers() async {
    Users result = await _repository.fetchUsers(loggedUser);
    users = result;
    inUsers.add(_usersController.value = result);
  }

  void fetchLoggedUser(String username) async {
    String id = await _repository.fetchId(username);
    loggedUser = id;
    inLoggedUser.add(_loggedUserController.value = id);
  }

  void like() async {
    int length = users.users.length;
    await api.like(loggedUser, users.users[length - 1].id);
    fetchUsers();
  }

  void dislike() async {
    int length = users.users.length;
    await api.dislike(loggedUser, users.users[length - 1].id);
    fetchUsers();
  }

  @override
  void dispose() {
    super.dispose();
    _usersController.close();
    _loggedUserController.close();
  }
}