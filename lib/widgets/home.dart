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
          child: Text("hello"),
        ),
      ),
    );
  }
}
