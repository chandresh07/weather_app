


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/slider_data.dart';
import '../services/news.dart';


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

  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;


  @override
  void initState(){
    getNews();
    getSlider();
    super.initState();
    _tabController = TabController(length: _tablist.length, vsync: this );
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  getNews()async{
    News newsclass = News();
    await newsclass.getNews();
    articles=newsclass.news;
    setState(() {
      _loading =false;
    });
  }

  getSlider()async{
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
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
              // padding: EdgeInsets.zero,
              //indicatorPadding: EdgeInsets.zero,
              labelColor: Colors.black,
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              tabs:_tablist,
            )
        ),
      ),
      body://_loading? Center(child: CircularProgressIndicator()):
    SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Featured News", style: TextStyle(color: Colors.black, fontSize: 20.0 ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>AllNews(news: ("Breking"))));
                    },
                    child: Text("View all",style: TextStyle(color: Colors.black45, fontSize: 16.0 ),),
                  ),
                ],
              ),
            ),
            CarouselSlider.builder(
                itemCount:sliders.length,
                itemBuilder: (context,index,realIndex){
              String?  res= sliders[index].urlToImage;
              String? res1 = sliders[index].title;
              return buildImage(res!,index,res1!);
            } ,options: CarouselOptions(
                height: 300,
                //viewportFraction:1,
               enlargeCenterPage: false,
                autoPlay: true,
               enlargeStrategy:CenterPageEnlargeStrategy.height)
              ),
             Padding(padding:
            EdgeInsets.fromLTRB(15.0,15.0,15.0,5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent News", style: TextStyle(color: Colors.black, fontSize: 22.0 ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>AllNews(news: ("Recent"))));
                  },
                  child: Text("View all", style: TextStyle(color: Colors.black45, fontSize: 16.0 ),),
                ),
              ],
            ),),
             SizedBox(height: 10),
          ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount:articles.length,
            shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              //articles.length,
              itemBuilder: (context,index){
            return BlogTile(
              url: articles[index].url!,
                desc: articles[index].description!,
                imageUrl: articles[index].urlToImage!,
                title: articles[index].title!);
          }
          )
          ],
        ),
      ),
    );
  }


  Widget buildImage(String image,int index,String name) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
           children: [
              ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: CachedNetworkImage(
               imageUrl: image,
               height: 100,  //300
               fit: BoxFit.cover,
               width: MediaQuery.sizeOf(context).width,
               //width:MediaQuery.of(context).size.width,
             ),
       ),
        Container(
              padding: EdgeInsets.only(left: 10.0),
              margin:  EdgeInsets.only(top: 175.0),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
              color: Colors.black26,borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              ),
          ),
          child: Text(
              name,style:TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500),),
        )
      ],
    ),
  );
}




class BlogTile extends StatelessWidget {

  String imageUrl,title,desc, url;
  BlogTile({
    required this.desc,
    required this.imageUrl,
    required this.title,
    required this.url});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return  GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            height: 120,
                            width: width * .5,
                            //120,
                            // MediaQuery.of(context).size.width,

                            fit: BoxFit.cover,))),
                   SizedBox(width: 8.0  ),
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 17),
                          )
                      ),
                   SizedBox(height: 7.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.8,
                    child: Text(
                      desc,
                    style:  TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0),
                       ),
                     ),
                   ],
                 ),
               ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
