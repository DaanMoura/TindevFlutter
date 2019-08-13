import 'package:app_tindev/src/blocs/AppBloc.dart';
import 'package:app_tindev/src/ui/main_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final BaseController bloc = BlocProvider.getBloc<BaseController>();

    void submit() {
      if (this._formKey.currentState.validate()) {
        _formKey.currentState.save();
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Form(
        key: this._formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: TextFormField(
                onSaved: (String value) async {
                  if (value.isNotEmpty) {
                    await bloc.fetchLoggedUser(value);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  }
                },
                cursorColor: Colors.grey,
                style: TextStyle(color: Color(0xFF666666)),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFFBBBBBB)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Digite seu usuário do Github",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange[300])),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDDDDD))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00DDDD))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Container(
                width: screenWidth,
                height: 56,
                child: Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: Color(0xFFDF4723),
                  child: InkWell(
                    onTap: submit,
                    key: GlobalKey(),
                    hoverColor: Colors.white70,
                    splashColor: Colors.white60,
                    highlightColor: Colors.white30,
                    child: Center(
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
