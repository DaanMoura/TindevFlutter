import 'dart:convert';

import 'package:app_tindev/src/models/user.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();

  Future<Users> fetchUsers(String loggedUser) async {
    print("fetch users.. user: $loggedUser");
    final response = await client.get(
      "http://b530066b.ngrok.io/devs",
      headers: {"user": loggedUser},
    );
    print("chegou aqui");
    print(response.body.toString());

    if (response.statusCode == 200) {
      print("fetch users OK");
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  like(String loggedUser, String user) async {
    print("liking..");
    final response = await client.post(
      "http://b530066b.ngrok.io/devs/${user}/likes",
      headers: {"user": loggedUser},
    );

    print(response.body.toString());

    if (response.statusCode == 200) {
      print("like OK!");
      return true;
    } else {
      print("Failed to like");
      return false;
    }
  }

  dislike(String loggedUser, String user) async {
    print("liking..");
    final response = await client.post(
      "http://b530066b.ngrok.io/devs/${user}/dislikes",
      headers: {"user": loggedUser},
    );

    print(response.body.toString());

    if (response.statusCode == 200) {
      print("like OK!");
      return true;
    } else {
      print("Failed to like");
      return false;
    }
  }

  Future<String> login(String username) async {
    print("login... $username");
    var jsonString = json.encode({"username" : username});
    print(jsonString);
    final response = await client.post(
      "http://b530066b.ngrok.io/devs",
      body: jsonString,
      headers: {"Content-Type": "application/json"}
    );

    print(response.body.toString());

    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      String userId = json['_id'].toString();
      print("login OK! $userId");
      return userId;
    } else {
      throw Exception("Failed to login");
    }
  }
}
