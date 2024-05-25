import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Staggerrtile extends StatefulWidget {
   Staggerrtile({super.key, required this.imageUrl, required this.name, required this.price});
  final   String imageUrl;
  final String name;
  final String price;

  @override
  State<Staggerrtile> createState() => _StaggerrtileState();
}

class _StaggerrtileState extends State<Staggerrtile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16),
      ),child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        CachedNetworkImage(imageUrl: widget.imageUrl,fit: BoxFit.fill),
              
             Expanded(
               child: Container(height: 50,
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [ Text(widget.name,style: Appstyle().appstyle(18, Colors.black, FontWeight.bold),),
                   Text("\$"+widget.price,style: Appstyle().appstyle(18, Colors.black, FontWeight.bold),)],),
               ),
             )
            ],),
      ),
    );
  }
}
