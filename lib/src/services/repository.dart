import 'package:app_tindev/src/services/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future fetchUsers(String loggedUserId) => apiProvider.fetchUsers(loggedUserId);
  Future fetchId(String loggedUser) => apiProvider.login(loggedUser);
}