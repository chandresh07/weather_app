
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList = [];
  String singlevalue = "";
  TextEditingController _textEditingController  = TextEditingController();

  void clearTextField(){
    _textEditingController.clear();
  }

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Todo App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                       // color: Colors.blue[900],
                        shadowColor: Colors.blue,
                        elevation: 5,
                        color: Colors.white,
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 80,
                                  child: Text(
                                    todoList[index]['value'].toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 20,
                                    child:  TextButton(
                                        onPressed: () {
                                          deleteItem(index);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                       flex: 70,
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _textEditingController,
                            onChanged: (content) {
                              addString(content);
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                               // fillColor: Colors.blue[300],
                              // filled: true,
                              // labelText: 'TO-DO',
                                hintText: 'TO-DO',
                                labelStyle: TextStyle(
                                 // color: Colors.indigo[900],
                                  color: Colors.black26,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: 5,
                          )),
                      Expanded(
                          flex: 27,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: () {
                              addList();
                              clearTextField();
                            },
                            child: Container(
                                height: 15,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                          )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
