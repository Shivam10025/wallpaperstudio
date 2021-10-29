import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
class ImageView extends StatefulWidget{
  final String imgurl;
  ImageView({required this.imgurl});
  @override
  _ImageViewState createState() =>_ImageViewState();
}

class _ImageViewState  extends State<ImageView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgurl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgurl , fit: BoxFit.cover,)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              GestureDetector(
                onTap: (){
                  _save();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.symmetric(horizontal: 0 , vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54 , width: 1),
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color(0x36ffffff),
                      Color(0x0fffffff)
                    ]
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("Set WallPaper" , ),
                      Text("Image will be Save in Photos" , style: TextStyle(
                        fontSize: 10 , color: Colors.white70
                      ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text("Cancel" , style: TextStyle(
                  color: Colors.white
                ),),
              ),
                SizedBox(
                  height: 50,
                )
            ],),
          )
        ],
      ),
    );
  }
  _save() async {
    if(Platform.isAndroid){
      await _askPermission();
    }
    var response = await Dio().get(widget.imgurl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */await PermissionHandler()
          .requestPermissions([PermissionGroup.photos]);
    } else {
      /* PermissionStatus permission = */await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }
}