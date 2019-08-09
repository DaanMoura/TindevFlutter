import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xffeeeeee),
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
                    onTap: (){},
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
