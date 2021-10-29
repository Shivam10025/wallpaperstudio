import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperstudio/model/wallpaper_model.dart';
import 'package:wallpaperstudio/views/imageview.dart';

Widget BrandName(){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500),
      children: const <TextSpan>[
        TextSpan(text: 'WallPaper', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black87)),
        TextSpan(text: 'Studio', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blueAccent)),
      ],
    ),
  );
}

Widget WallpaperList({required List<Wallpaper_Model> wallpapers , context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(crossAxisCount: 2 ,
    shrinkWrap: true,
    childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imgurl: wallpaper.src.portrait)));
          },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(wallpaper.src.portrait , fit: BoxFit.cover,))
            ),
          ),
        ));
      }).toList(),
    ),
  );
}