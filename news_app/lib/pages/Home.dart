
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/pages/article_view.dart';

import '../models/headlines_model.dart';
import '../view_model/news_view_model.dart';
import 'news_detail_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Tab> _tablist = [
     Tab(child: Text("Home"),),
     Tab(child: Text("Technology"),),
     Tab(child: Text("Sport"),),
     Tab(child: Text("Travel"),),
     Tab(child: Text("State"),),
  ];
  late TabController _tabController;
  NewsViewModel newsViewModel = NewsViewModel();

  final format = DateFormat('dd MMMM, yyyy');

  bool _loading = true;


  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: _tablist.length, vsync: this );
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        leading: IconButton(
          onPressed: (){},
          icon:const Icon(Icons.menu_outlined,),
        ),
        title: const Text('DECO NEWS',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold)
          ,),
        centerTitle: true,
        actions: [
          IconButton(
            icon:const Icon(Icons.search),
            onPressed: (){},
          )
        ],
        bottom: PreferredSize(
            preferredSize:Size.fromHeight(30.0),
            child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.black26,
              labelColor: Colors.black,
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              tabs:_tablist,
            ),
        ),
      ),
      //_loading ? Center(child: CircularProgressIndicator()):
      body: SafeArea(
        child: Padding(
                  padding:EdgeInsets.fromLTRB(0.0,15.0,0.0,5.0),
                      child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Featured news",style:
                            TextStyle(color: Colors.black, fontSize: 20.0 ),),
                            Text("View all",style:
                            TextStyle(color: Colors.black45, fontSize: 14.0 ),),
                          ],
                        ),
                         Padding(
                           padding:EdgeInsets.only(top: 10,),
                           child: SizedBox(
                             width: width,
                             height: height * .35,
                             child: FutureBuilder<HeadlinesModel>(
                               future: newsViewModel.fetchHeadlinesApi(),
                               builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: SpinKitCircle(
                                  size: 50,
                                  color: Colors.blue,
                                ),
                              );
                            } else {
                              return Container(
                                height: 50,
                                child: ListView.builder(
                                    //scrollDirection: Axis.horizontal,

                                    itemCount: snapshot.data!.articles!.length,
                                    itemBuilder: (context, index) {
                                      DateTime datetime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailScreen(
                                              NewsImage: snapshot.data!.articles![index].urlToImage.toString(),
                                              NewsTitle: snapshot.data!.articles![index].title.toString(),
                                              NewsDate: snapshot.data!.articles![index].publishedAt.toString(),
                                              author: snapshot.data!.articles![index].author.toString(),
                                              description:snapshot.data!.articles![index].description.toString(),
                                              content: snapshot.data!.articles![index].content.toString(),
                                              source: snapshot.data!.articles![index].source!.name.toString()
                                          ))
                                          );
                                        },
                                        child: SizedBox(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                  height : height * 0.6,
                                                  width: width * .9,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:5.0,
                                                    // height * .02,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(4),
                                                    child: CachedNetworkImage(
                                                      imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                                      fit: BoxFit.cover,
                                                      placeholder: (context, url) => Container(child: spinkit2,),
                                                      errorWidget: (context,url,error)=> Icon(Icons.error_outline,color: Colors.red,),
                                                    ),
                                                  )
                                              ),
                                              Positioned(
                                                bottom: 50,
                                                child: Card(
                                                  shadowColor: Colors.black,
                                                  color: Colors.transparent,
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(18),
                                                    alignment: Alignment.bottomCenter,
                                                    height: height * .20,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: width * 0.7,
                                                          child: Text(snapshot.data!.articles![index].title.toString(),
                                                            maxLines: 2,
                                                            style: TextStyle(color: Colors.white,fontSize: 16),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          width: width * 0.7,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                             Text(snapshot.data!.articles![index].source!.name.toString(),
                                                               // maxLines: 2,
                                                                style: TextStyle(color: Colors.white,fontSize: 12),
                                                                overflow: TextOverflow.ellipsis,),
                                                              Icon(Icons.access_time_filled_rounded,color: Colors.white,),
                                                              Text(format.format(datetime),
                                                                  style: TextStyle(color: Colors.white,fontSize: 12),),
                                                             ],
                                                           ),
                                                         )
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                                )
                                              ],
                                            ),
                                           ),
                                         );
                                       }
                                     ),
                              );
                                }
                              },
                             ),
                           ),
                         ),
                       Padding(padding:
                      EdgeInsets.fromLTRB(0.0,15.0,0.0,5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Recent News", style:
                          TextStyle(color: Colors.black, fontSize: 20.0 ),),
                          GestureDetector(
                           // onTap: (){
                           //   Navigator.push(context, MaterialPageRoute(
                             //     builder: (context)=>AllNews(news: ("Recent"))));
                           // },
                            child: Text("View all", style:
                            TextStyle(color: Colors.black45, fontSize: 14.0 ),),
                          ),
                        ],
                      ),),
                       SizedBox(height:5),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.0,5.0,5.0,5.0),
                          child: FutureBuilder<HeadlinesModel>(
                            future: newsViewModel.fetchHeadlinesApi(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(
                                  child: SpinKitCircle(
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.articles!.length,
                                    itemBuilder: (context, index) {
                                      DateTime datetime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailScreen(
                                              NewsImage: snapshot.data!.articles![index].urlToImage.toString(),
                                              NewsTitle: snapshot.data!.articles![index].title.toString(),
                                              NewsDate: snapshot.data!.articles![index].publishedAt.toString(),
                                              author: snapshot.data!.articles![index].author.toString(),
                                              description:snapshot.data!.articles![index].description.toString(),
                                              content: snapshot.data!.articles![index].content.toString(),
                                              source: snapshot.data!.articles![index].source!.name.toString()
                                          )));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(4),
                                                child: CachedNetworkImage(
                                                  imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                                  fit: BoxFit.cover,
                                                  height: height * .18,
                                                  width: width * .3,
                                                  placeholder: (context, url) => Container(child: Center(
                                                    child: SpinKitCircle(
                                                      size: 50,
                                                      color: Colors.blue,
                                                    ),
                                                  )
                                                  ),
                                                  //errorWidget: (context,url,error)=> Icon(Icons.error_outline,color: Colors.red,),
                                                ),
                                              ),
                                              Expanded(child:
                                              Container(
                                                height: height * .18,
                                                padding: EdgeInsets.only(left: 15),
                                                child: Column(
                                                  children: [
                                                    Text(snapshot.data!.articles![index].title.toString(),
                                                      maxLines: 3,
                                                      style: TextStyle(fontSize: 15,color: Colors.black54),
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(snapshot.data!.articles![index].source!.name.toString(),
                                                          style: TextStyle(fontSize: 11,color: Colors.black54),
                                                        ),
                                                        Text(format.format(datetime),
                                                          style: TextStyle(fontSize: 11,color: Colors.black54),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                              }
                            },
                          ),
                        ),
                         ]
                      ),
                    ),
      ),

    );
   }
}

const spinkit2  = SpinKitFadingCircle(
  color: Colors.blue,
);


/*Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Padding(
padding: EdgeInsets.all(15.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [

Text("Featured News", style: TextStyle(color: Colors.black, fontSize: 20.0 ),),
GestureDetector(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(
//   builder: (context)=>AllNews(news: ("Breking"))));
//},
child: Text("View all",style: TextStyle(color: Colors.black45, fontSize: 16.0 ),),
),
],
),
)*/