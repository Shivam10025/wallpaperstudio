import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperstudio/widget/widget.dart';
import 'package:wallpaperstudio/data/data.dart';
import 'package:wallpaperstudio/model/categoriesmodel.dart';
import 'package:wallpaperstudio/model/wallpaper_model.dart';
import 'package:wallpaperstudio/views/search.dart';
import 'package:wallpaperstudio/widget/widget.dart';
import 'package:http/http.dart' as http;
class Category extends StatefulWidget {
  late String cq;
  Category({required this.cq});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>{
  late String queryp;
  TextEditingController textEditingController = new TextEditingController();
  List<CategoriesModel> cat = [];
  List<Wallpaper_Model> wallpaper = [];
  getSearchWallpapers(String query) async {
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=15&page=1" ,
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
    getSearchWallpapers(widget.cq);
    super.initState();
    textEditingController.text = widget.cq;
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
              SizedBox(height: 16.0,),
              WallpaperList(wallpapers: wallpaper , context: context)
            ],
          ),
        ),
      ),
    );
  }

}