import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
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
      home: const Chandresh(title: 'BMI App',),
    );
  }
}

class Chandresh extends StatefulWidget{
  const Chandresh({super.key, required this.title});
  final String title;

  @override
  State<Chandresh> createState() => _ChandreshState();
}

class _ChandreshState extends State<Chandresh> {

  var wtControler = TextEditingController();
  var ftControler = TextEditingController();
  var inControler = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Center(child: Text("BMI Calculations")),
        ),
        body:Center(
          child: Container(
            width: 100,
            color: Colors.greenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('BMI', style:
                TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 23,
                ), ),

                const SizedBox(height: 20,),
                TextField(
                  controller: wtControler ,
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
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      label: const Text('Enter Your Weight in Kg'),
                      prefixIcon: const Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,

                ),

                const SizedBox(height: 20,),
                TextField(
                  controller: ftControler,
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
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      label: const Text('Enter Your Height in Feet'),
                      prefixIcon: const Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),

                const SizedBox(height: 20,),
                TextField(
                  controller: inControler ,
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
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      label: const Text('Enter Your Height in Inches'),
                      prefixIcon: const Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),

                const SizedBox(height: 30,),

                ElevatedButton(onPressed: (){

                  var wt = wtControler.text.toString();
                  var ft = ftControler.text.toString();
                  var inch = inControler.text.toString();



                  if(wt!= ""  && ft!= "" && inch!= ""){
                    //Bmi Calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    var tinch = (ift*12) + iinch;
                    var tcm = tinch*2.54;
                    var tm = tcm/100;

                    var bmi = iwt/(tm*tm);
                    setState(() {
                      result = "Your BMI is  ${bmi.toStringAsFixed(4)} ";
                    });
                  }
                  else{
                    setState(() {

                      result = 'Pls Enter the Required Fields';
                    });
                  }
                }, child: const Text('Result')),

                const SizedBox(height: 11,),

                Text(result,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)

              ],
            ),
          ),
        )
    );
  }
}