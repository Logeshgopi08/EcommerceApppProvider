import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappp/Provider/favouriteprovider.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favaouitepage extends StatefulWidget {
  const Favaouitepage({super.key});

  @override
  State<Favaouitepage> createState() => _FavaouitepageState();
}

class _FavaouitepageState extends State<Favaouitepage> {
  @override
  Widget build(BuildContext context) {
     var favouritenotifier = Provider.of<FavouriteProvider>(context);
     favouritenotifier.getfavdata();
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(onTap: (){
                Navigator.pop(context);
              },
                  child: Icon(Icons.close,color: Colors.white,)),
              Center(child: Text("My favourite",style: Appstyle().appstyle(25, Colors.white,FontWeight.bold),)),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:favouritenotifier.favor.length,
                itemBuilder: (context,index){
                  final data = favouritenotifier.favor[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.13,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(0,1),spreadRadius: 0.4,blurRadius: 0.5
                        )]
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        CachedNetworkImage(imageUrl: data['imageUrl'],fit: BoxFit.fill,
                        height: 50,width: 50,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['name'],style: Appstyle().appstyle(18, Colors.black, FontWeight.w700),),
                            SizedBox(height: 6,),
                            Text(data['category'],style: Appstyle().appstyle(16, Colors.grey, FontWeight.w400),),
                            SizedBox(height: 6,),
                            Text("\$"+data['price'],style: Appstyle().appstyle(18, Colors.black, FontWeight.w700),)
                          ],),
                        
                        InkWell(onTap: (){
                        setState(() {
                         favouritenotifier.deletefav(data['key']);
                         favouritenotifier.ids.removeWhere((element) => element == data['id']);
                          print("deleted");
                        });
                        },
                            child: const Icon(Icons.delete,color: Colors.black,))
          
          
                      ],),
                    ),
                  );
                },),
              )
            ],),
          ),
        )
    );
  }
}
