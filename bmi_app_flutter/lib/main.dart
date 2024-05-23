import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Home(
        title: 'BMI App',
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.white;


  @override
  Widget build(BuildContext context)
  {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text("BMI Calculation")),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
               // height: double.infinity, //will give error
                color: const Color.fromARGB(255, 244, 248, 248),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/yoga.png",
                      width: double.infinity,
                      height: height * 0.80,
                    ),
                    const Text(
                      'Calculate Your Body Mass Index',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextField(
                          controller: wtController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2)),
                              label: const Text('Weight in Kg'),
                              prefixIcon: const Icon(Icons.line_weight),
                              suffixText: "KG"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: TextField(
                              controller: ftController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black12, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2)),
                                  label: const Text('Height in Feet'),
                                  prefixIcon: const Icon(Icons.height),
                                  suffixText: "Feet"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: TextField(
                              controller: inController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black12, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2)),
                                  label: const Text('Height in Inches'),
                                  prefixIcon: const Icon(Icons.height),
                                  suffixText: "inch"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 5),
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inController.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            //Bmi Calculation
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);

                            var tinch = (ift * 12) + iinch;
                            var tcm = tinch * 2.54;
                            var tm = tcm / 100;

                            var bmi = iwt / (tm * tm);
                            var msg = "";
                            if (bmi > 25) {
                              msg = "You're OverWeight!!";
                              //bgColor = Colors.yellowAccent;
                            } else if (bmi < 18) {
                              msg = "You're UnderWeight!!";
                              //bgColor = Colors.red;
                            } else {
                              msg = "You're Healthy!!";
                              //bgColor = Colors.green;
                            }
                            setState(() {
                              result = "$msg \nYour BMI is  ${bmi.toStringAsFixed(4)} ";
                            });
                          } else {
                            setState(() {
                              result = 'Pls Enter The Required Fields';
                            });
                          }
                        },
                        child: const Text('Result'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          result,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
