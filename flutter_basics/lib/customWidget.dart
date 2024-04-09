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
    return Scaffold(
        appBar: AppBar(

          title: const Center(child: Text('Flutter Projects')),
        ),
        body: Container(
          child: Column(
            children: [
              catItems(), contact(), subCatItems(), bottomMenu()],
          ),
        )
    );
  }// This trailing comma makes auto-formatting nicer for build methods.
}








class catItems extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue,
          child: ListView.builder(itemBuilder:(context, index) => const Padding(padding: EdgeInsets.all(11),
            child: SizedBox(
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.green,
              ),
            )
            ,),itemCount: 10,scrollDirection: Axis.horizontal,),
        ));
  }
}

class contact extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.blueGrey,
        child: ListView.builder(itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(8.0),
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
              ),
              title: Text('Name'),
              subtitle: Text('Mob No'),
              trailing: Icon(Icons.delete)
          ),),),
      ),
    );
  }
}





class subCatItems extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return Expanded(
        flex: 1,
        child : Container(
          color : Colors.blue,
          child: ListView.builder(itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),itemCount: 10, scrollDirection: Axis.horizontal,),
        )
    );
  }
}






class bottomMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.grey,
        child: GridView.count(crossAxisCount: 4,
          children: [
            Padding(padding:
            const EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(padding:
            const EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue,)
                ,),
            ),
            Padding(padding:
            const EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue,)
                ,),
            ),
            Padding(padding:
            const EdgeInsets.all(11),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue,),),)
          ],),
      ),
    );
  }
}
