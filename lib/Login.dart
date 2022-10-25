import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/food_page.dart';
import 'package:project_learning_g1/register.dart';
import 'package:http/http.dart' as http;

var islogin = false;
var nofication = true;
Future<bool> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://fakestoreapi.com/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    islogin = true;
    return true;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return false;
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  Future<bool>? _login;
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Logo(context),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "vui long nhap ten dang nhap";
                    } else if (value.length < 5) {
                      return "ten dang nhap qua ngan";
                    }
                    username = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Ten dang nhap"),
                    hintText: "Vui long nhap ten dang nhap",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "vui long nhap mat khau";
                    }
                    password = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Mat khau"),
                    hintText: "Vui long nhap mat khau",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() async {
                        await (_login = login(username, password));
                        if (islogin) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FoodPage()),
                          );
                        } else {
                          setState(() {
                            nofication = false;
                          });
                        }
                      });
                      // Form OK
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Register()),
                      // );
                    } else {
                      // Form not OK
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    fixedSize: Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text("Dang nhap"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Form OK
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    fixedSize: Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text("Dang ky"),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  nofication ? "" : "Tai khoan va mat khau sai!!",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Logo(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
