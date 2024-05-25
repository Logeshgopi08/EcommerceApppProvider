import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappp/Provider/cartprovider.dart';
import 'package:ecommerceappp/Screens/shared/Addcartbutton.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
   const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
   var cartnotifier= Provider.of<CartProvider>(context);
   cartnotifier.getcartdata();

    return  Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                IconButton(icon: Icon(Icons.delete,color: Colors.black,),onPressed: (){
                  Navigator.pop(context);
                },),
                Center(child: Text("Mycart",style: Appstyle().appstyle(24, Colors.black, FontWeight.bold),)),
                const  SizedBox(height: 20,),
                SizedBox(height: MediaQuery.of(context).size.height*0.6,
                  child: ListView.builder(
                    itemCount:cartnotifier.cart.length ,shrinkWrap: true,
                    itemBuilder: (context,index){
                      final data = cartnotifier.cart[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(borderRadius: BorderRadius.circular(18),
                          child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,onPressed: null,
                                    backgroundColor: const Color(0xFF000000),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: "Delete",
                                  )
                                ],
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.13,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: Offset(0,1),
                                        spreadRadius: 0.5,blurRadius: 0.3
                                    )]
                                ),
                                child: Center(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      CachedNetworkImage(imageUrl:data['imageUrl'],fit: BoxFit.fill,
                                      width: 60,height: 60,),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(data['name'],style: Appstyle().appstyle(16, Colors.black, FontWeight.w300),),
                                          Text(data['category'],style: Appstyle().appstyle(16, Colors.black, FontWeight.w300),),
                                          Text("\$"+data['price'],style: Appstyle().appstyle(16, Colors.black, FontWeight.w300),),
                                        ],),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0,left: 6),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(onTap:(){},
                                              child: Icon(Icons.add,color: Colors.black,size: 20,)),
                                          SizedBox(height: 8,),
                                          Text(data['qty'].toString(),style: Appstyle().appstyle(16, Colors.black, FontWeight.w200),),
                                          SizedBox(height: 8,),
                                         InkWell(onTap:(){},
                                             child: Icon(Icons.remove,color: Colors.black,size: 20,))
                                        ],),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    },
                  ),)
              ],),
            Align(alignment: Alignment.bottomCenter,
            child: Addcartbutton(label: "Proceed to checkout",ontap: (){},),)
          ],),
        )
    );
  }
}

