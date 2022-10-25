import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_learning_g1/Login.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "vui long nhap mat khau";
                    }
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
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "vui long nhap mat khau";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Nhap lai mat khau"),
                    hintText: "Vui long nhap lai mat khau",
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
                      // Form OK
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWidget()),
                      );
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
                  child: Text("Dang ky"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    fixedSize: Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text("Quay lai"),
                ),
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
