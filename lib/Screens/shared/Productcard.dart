import 'package:ecommerceappp/Provider/favouriteprovider.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Faovaritepage.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.name, required this.price,
    required this.category, required this.id, required this.image});

  final String name;
  final String price;
  final String category;
  final String id;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    var favouritenotifier = Provider.of<FavouriteProvider>(context);
    favouritenotifier.getfav();
    return Padding(padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
    child: ClipRRect(borderRadius: BorderRadius.circular(18),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.white,spreadRadius: 1,blurRadius: 1,offset: Offset(1,1))
        ]),child: Column(crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(height: MediaQuery.of(context).size.height*0.26,
            decoration: BoxDecoration(image: DecorationImage
              (image: NetworkImage(widget.image))),),
            Positioned(right: 10,top: 10,
                child: InkWell(onTap: (){
                 setState(() {
                   if(favouritenotifier.ids.contains(widget.id)){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Favaouitepage()));
                   }else{
                     favouritenotifier.createFav({
                       "id":widget.id,
                       "name":widget.name,
                       "price":widget.price,
                       "category":widget.category,
                       "imageUrl":widget.image
                     });
                   }
                 });
                },
                    child:favouritenotifier.ids.contains(widget.id)?Icon(Icons.favorite):Icon(Icons.favorite_border)))
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name,style: Appstyle().appstylewithht(20, Colors.black, FontWeight.bold, 1.1)),
            // Text(widget.category,style: Appstyle().appstylewithht(15, Colors.grey, FontWeight.bold, 1.1))
          ],),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8,top:8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$"+
                  widget.price,
                  style: Appstyle().appstyle(30, Colors.black, FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      "Colors",
                      style: Appstyle().appstyle(18, Colors.grey, FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(width: 12,height: 20,
                      child: ChoiceChip(label: const Text(""),
                        selected: selected,
                        visualDensity: VisualDensity.compact,
                        selectedColor: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],),
      ),
    ),);
  }
}
