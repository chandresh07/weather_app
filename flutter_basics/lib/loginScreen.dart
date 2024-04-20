import 'package:flutter/material.dart';
//import 'package:flutter_basics/main.dart';

class LoginScreen extends  StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var No1Controller = TextEditingController();
  var No2Controller = TextEditingController();

  var result ='';
  @override
  Widget build(BuildContext context) {
    var emailText = TextEditingController();
    var passText = TextEditingController();
    return Scaffold(
      appBar: AppBar(

        title: const Center(child: Text('Flutter Projects')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Email Here',
                      prefixIcon: const Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.blueGrey,
                          )
                      )
                  ),
                ),
                Container(
                  height: 11,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: passText,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your PassWord Here',
                    prefixIcon: const Icon(Icons.password),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          width: 2,
                          color:  Colors.blueGrey,
                        )
                    ),
                  ),
                ),
                Container(
                  height: 11,
                ),
                ElevatedButton( onPressed:() {
                   String uEmail = emailText.text.toString();
                    String uPass = passText.text;
                    print("Email:$uEmail,pass:$uPass");
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const Chandresh(title: 'Basic Calculator')));
                },child: const Text('login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}