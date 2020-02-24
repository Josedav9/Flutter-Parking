import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _userPassword = TextEditingController();
  final url = '';

  void _submitData() {
    String userName = _userNameController.text;
    String userPassword = _userPassword.text;
    var body = {'user_name': userName, 'password': userPassword};
    http.post(url, body: {...body}).then((response) {
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xffed00), const Color(0x020024)],
          ),
        ),
        child: Center(
          child: Card(
            elevation: 20,
            margin: EdgeInsets.all(50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de Usuario',
                      icon: Icon(Icons.person),
                    ),
                    controller: _userNameController,
                    keyboardType: TextInputType.text,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña', icon: Icon(Icons.vpn_key)),
                    controller: _userPassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSubmitted: (_) => _submitData(),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Iniciar Sesion'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: _submitData,
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: _submitData,
                    child: Text("Registarse"),
                    textColor: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
