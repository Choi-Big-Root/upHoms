import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void showFullScreenImage(BuildContext context, String imageUrl){
  showDialog(context: context, builder: (context){
    return GestureDetector(
        onTap: (){Navigator.of(context).pop();},
        child: Container(
          color: Colors.black,
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: imageUrl.startsWith(
                'data:image',
              )
                  ? Image.memory(
                base64Decode(
                  imageUrl
                      .split(
                    ',',
                  )
                      .last,
                ),
                fit: BoxFit.fitWidth,
              )
                  : CachedNetworkImage(
                imageUrl:
                imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ));
  });
}