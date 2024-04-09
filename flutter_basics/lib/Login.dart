import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
                 // String uEmail = emailText.text.toString();
                //  String uPass = passText.text;
                //  print("Email:$uEmail,pass:$uPass");
                },child: const Text('login'))
              ],
            ),
          ),
        ),
      ),
    );

  }// This trailing comma makes auto-formatting nicer for build methods.
}
