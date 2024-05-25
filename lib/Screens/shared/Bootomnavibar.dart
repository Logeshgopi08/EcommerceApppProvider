import 'package:ecommerceappp/Provider/Mainscreenprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/Bottonavi_widgets.dart';

class Bottomnavibar extends StatelessWidget {
  const Bottomnavibar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Mainscreennotifier>(builder: (context,screenvalue,child){
      return SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(18)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bottom_naviwidget(icon: screenvalue.pageindex==0 ?Icons.home:Icons.home_outlined
                ,ontap: (){
                  screenvalue.pageindex=0;
                },),
              Bottom_naviwidget(icon: Icons.search,ontap: (){
                screenvalue.pageindex=1;
              },),
              Bottom_naviwidget(icon: Icons.favorite,ontap: (){
                screenvalue.pageindex=2;
              },),
              Bottom_naviwidget(icon: Icons.shopping_cart,ontap: (){
                screenvalue.pageindex=3;
              },),
              Bottom_naviwidget(icon: Icons.account_circle,ontap: (){
                screenvalue.pageindex=4;
              },)
            ],),
        ),
      ));
    });
  }
}
