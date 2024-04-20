

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/article_view.dart';
import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];

  void initState() {
    super.initState();
    getNews();
    getSlider();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {

    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deco News"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return AllNewsSection(
                  url: articles![index].url!,
                  desc: articles![index].description!,
                  Image: articles![index].urlToImage!,
                  title: articles![index].title!,
              );
            }),
      ),
    );
  }
}


class AllNewsSection extends StatelessWidget {
  String Image,desc,title,url;
  AllNewsSection({
    required this.title,
    required this.desc,
    required this.url,
    required this.Image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ArticleView(
                blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: Image,
                  width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover),
            ),
            SizedBox(height:5.0),
            Text(title,
              maxLines: 2,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold ),),
            Text(desc,maxLines: 3,),
            SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}
