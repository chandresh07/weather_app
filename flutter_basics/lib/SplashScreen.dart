import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basics/loginScreen.dart';
class SpalashScreen extends StatefulWidget{
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginScreen(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
                color: Colors.blue,
          child: const Center(child: Text('Rathod',style:
            TextStyle(fontSize: 20,fontWeight: FontWeight.w800,fontStyle: FontStyle.italic
            ),),),
        ),
      ),

    );
  }
}