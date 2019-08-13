import 'package:app_tindev/src/blocs/AppBloc.dart';
import 'package:app_tindev/src/models/user.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BaseController blocBase = BlocProvider.getBloc<BaseController>();

    Widget _buildCard({String name, String bio, String avatar}) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Container(
              color: Colors.white,
              child: Image.network(
                avatar,
                height: 250,
                width: 250,
              ),
            ),
          ),
          Container(
            width: 250,
            height: 80,
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        bio == null ? " " : bio,
                        style: TextStyle(color: Colors.black45, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildStack(AsyncSnapshot<Users> snapshot) {
      List<UserModel> users = snapshot.data.users;
      int length = users.length;
      print(users.length);
      List<Widget> cards = [];

      if (length > 0) {
        for (int i = 0; i < length; i++) {
          UserModel user = users[i];
          cards.add(
              _buildCard(name: user.name, bio: user.bio, avatar: user.avatar));
        }
        // return Row(children: cards,);
        return Stack(
          children: cards,
          alignment: AlignmentDirectional.center,
        );
      }

      return Text("Acabou :(");
    }

    Widget botoes = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              blocBase.dislike();
              blocBase.fetchUsers();
            },
            child: Image.asset('assets/dislike.png'),
            backgroundColor: Colors.white,
          ),
        ),
        FloatingActionButton(
          heroTag: "2",
          onPressed: () {
            blocBase.like();
            blocBase.fetchUsers();
          },
          child: Image.asset('assets/like.png'),
          backgroundColor: Colors.white,
        ),
      ],
    );

    blocBase.fetchUsers();

    return Scaffold(
      key: GlobalKey(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/logo.png'),
                StreamBuilder(
                  stream: blocBase.outUsers,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return buildStack(snapshot);
                    } else if (snapshot.hasError) {
                      return Text("Algum erro aconteceu");
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                botoes,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
