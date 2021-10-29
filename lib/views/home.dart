import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperstudio/data/data.dart';
import 'package:wallpaperstudio/model/categoriesmodel.dart';
import 'package:wallpaperstudio/model/wallpaper_model.dart';
import 'package:wallpaperstudio/views/category.dart';
import 'package:wallpaperstudio/views/imageview.dart';
import 'package:wallpaperstudio/views/search.dart';
import 'package:wallpaperstudio/widget/widget.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  List<CategoriesModel> cat = [];
  List<Wallpaper_Model> wallpaper = [];
  TextEditingController textEditingController = new TextEditingController();
  getTrendingWallpapers() async {
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1" ,
    headers: {"Authorization" : "563492ad6f91700001000001604c65b001fd436f94be7d2e226a44e3"}
    );
    //print(response.body.toString());
    Map<String , dynamic> jsondata= jsonDecode(response.body);
    jsondata["photos"].forEach((element){
      Wallpaper_Model wallpaper_model= new Wallpaper_Model.fromMap(element);
      wallpaper.add(wallpaper_model);
    });
    setState(() {

    });
  }
  @override
  void initState() {
    getTrendingWallpapers();
      cat = getCategories();
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5f0),
      appBar: AppBar(
        title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffe4effb),
                  borderRadius: BorderRadius.circular(32)
                ),
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: "Search Wallpaper",
                        border: InputBorder.none,
                        labelText: "Search"
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                        searchquery: textEditingController.text,
                      )));

                    },
                    child: Container(
                        child: Icon(Icons.search)),
                  ),
                ],),
              ),
              SizedBox(height: 16.0,),
              Container(
                height: 80,
                child: ListView.builder(itemBuilder: (context , index){
                  return CatTile(title: cat[index].categoriesName, imgurl: cat[index].categoriesurl);
                },
                  itemCount: cat.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
              ),
              WallpaperList(wallpapers: wallpaper , context: context)
            ],
          ),
        ),
      ),
    );
  }
}
class CatTile extends StatelessWidget{
  late String imgurl , title;
  CatTile({ required this.title , required this.imgurl});
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Category(cq: title.toLowerCase())));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imgurl , height: 60, width: 100, fit: BoxFit.cover,),
            ),
            Container(
              height: 60, width: 100,
              alignment: Alignment.center,
              child: Text(title , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 16),),
            )
          ],),
        ),
      );
  }

}