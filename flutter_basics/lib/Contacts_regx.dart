import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,

      ),
      home:const MyHomePage(title: 'flutter Demo',) ,

    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{

  TextEditingController phControler = TextEditingController();
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flutter Contact ")),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Form(
                  key : _Formkey,
                  child:
                  TextFormField(
                      controller: phControler,
                      onChanged: (value){
                        _Formkey.currentState?.validate();
                      },
                      validator:( value) {
                        String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = RegExp(pattern);
                        if (value?.length == 0) {
                          return 'Please enter mobile number';
                        }
                        else if (!regExp.hasMatch(value!)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      }
                  )
              ),
              Row(
                children :[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Colors.black12,
                                    width: 2
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color : Colors.black,
                                    width: 2
                                )
                            ),
                            label: const Text("Enter First Name")
                        ),

                      ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Colors.black12,
                                    width: 2
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color : Colors.black,
                                    width: 2
                                )
                            ),
                            label:const Text( "Enter Last Name")
                        ),
                      ),),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black12,
                            width: 2,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color : Colors.black,
                            width: 2,
                          )
                      ),
                      label:const Text( "Enter Email")
                  ),
                ),
              ),
              const SizedBox(height: 10,),


              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: IntlPhoneField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Colors.black12,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color : Colors.black,
                            width: 2
                        )),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color : Colors.black,
                              width: 2
                          )
                      ),
                      label:const Text( "Enter Street Name")
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color : Colors.black,
                              width: 2
                          )
                      ),
                      label:const Text( "Enter City Name")
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color : Colors.black,
                              width: 2
                          )
                      ),
                      label:const Text( "Enter State Name")
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color : Colors.black,
                              width: 2
                          )
                      ),
                      label:const Text( "Enter Country Name")
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color : Colors.black,
                              width: 2
                          )
                      ),
                      label:const Text( "Enter Zipcode ")
                  ),
                ),
              ),
              const SizedBox(height: 10,),


              Container(
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Colors.black12,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color : Colors.black,
                            width: 2
                        )
                    ),
                    label:const Text( "Write A Note Here"),
                  ),
                  style: const TextStyle(
                    fontSize: 16,),
                  maxLines: 3,
                  maxLength: 100,
                ),
              ),
            ]
        ),
      ),
    );
  }
}