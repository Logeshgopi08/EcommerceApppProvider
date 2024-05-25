import 'package:ecommerceappp/Provider/ProductProvider.dart';
import 'package:ecommerceappp/Screens/Productbycart.dart';
import 'package:ecommerceappp/Screens/Productdescriptionpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/Sneakers_modal.dart';
import '../../utils/Appstyle.dart';
import 'Newshoes.dart';
import 'Productcard.dart';

class Hometabbarwidget extends StatelessWidget {
   Hometabbarwidget({
    super.key,
    required Future<List<Sneakers>> male, required this.tabindex,
  }) : _male = male;
   final int tabindex;

  final Future<List<Sneakers>> _male;


  @override
  Widget build(BuildContext context) {
    var productnotifier = Provider.of<ProductProvider>(context);
    return Column(children:
    [
      SizedBox(height: MediaQuery.of(context).size.height*0.4,
        child: FutureBuilder<List<Sneakers>>(
          future: _male,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.hasError){
              return Text("Error ${snapshot.error}");
            }else{
              final male = snapshot.data;
              return ListView.builder(itemCount: male!.length,shrinkWrap: true,scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    final shoes = snapshot.data![index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(onTap: (){
                          productnotifier.shoesize= shoes.sizes;
                          print(productnotifier.shoesize);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDescriptionPage(id: shoes.id, category: shoes.category)));
                        },
                          child: ProductCard(name: shoes.name,
                              price: shoes.price, category: shoes.category, id: shoes.id, image:
                              shoes.imageUrl[0]),
                        )
                    );
                  });
            }
          },
        ),),
      Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
          child: Row(children: [
            Text("Latest Models",style: Appstyle().appstyle(18, Colors.black, FontWeight.bold),),
            Spacer(),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Productbycart(tabindex:tabindex)));
            },
                child: Text("Show All",style: Appstyle().appstyle(18, Colors.black, FontWeight.bold),)),
            Icon(Icons.arrow_right,size: 25,)
          ],),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.15,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else if(snapshot.hasError){
                return Text("Error ${snapshot.error}");
              }else{
                final male = snapshot.data;
                return ListView.builder(itemCount: male!.length,shrinkWrap: true,scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      final shoes = snapshot.data![index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Newshoes(imageurl: shoes.imageUrl[1],)
                      );
                    });
              }
            },
          ),)
      ],)
    ],);
  }
}