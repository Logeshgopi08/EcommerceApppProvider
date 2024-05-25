import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newshoes extends StatelessWidget {
   Newshoes({
    super.key, required this.imageurl,
  });
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height*0.12,
      width: MediaQuery.of(context).size.width*0.28,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(
              color: Colors.white,spreadRadius: 1,blurRadius: 0.6,offset: Offset(0,1)
          )]),
      child: CachedNetworkImage(imageUrl: imageurl,),);
  }
}
