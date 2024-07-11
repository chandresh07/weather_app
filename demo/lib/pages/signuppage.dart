import 'dart:convert';
import 'package:http/http.dart';
import 'package:demo/pages/loginpage.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> login() async {
    String url = 'https://reqres.in/api/register';
    var body = {
      'email': emailcontroller.text,
      'password': passwordcontroller.text
    };
    try {
      Response response = await post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage()));
        print(data['token']);
        print('Register successfully');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("wrong email or password")));
        print('failed');
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter Password",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    login();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Sign in"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
