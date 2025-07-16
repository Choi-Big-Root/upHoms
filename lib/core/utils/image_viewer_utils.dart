import 'package:flutter/material.dart';

void showFullScreenImage(BuildContext context, String imageUrl){
  showDialog(context: context, builder: (context){
    return GestureDetector(
        onTap: (){Navigator.of(context).pop();},
        child: Container(
          color: Colors.black,
          child: Center(
            child: Image.network(imageUrl,fit: BoxFit.contain,),
          ),
        ));
  });
}