import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceappp/Provider/ProductProvider.dart';
import 'package:ecommerceappp/Screens/shared/Hometabbarwidget.dart';
import 'package:ecommerceappp/Screens/shared/Newshoes.dart';
import 'package:ecommerceappp/Screens/shared/Productcard.dart';
import 'package:ecommerceappp/services/Helper.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Sneakers_modal.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State <Homepage>with TickerProviderStateMixin {


  // this is used homestate provide the missing object to the controller
     late  final TabController _tabController = TabController(length: 3, vsync: this);


  @override
  Widget build(BuildContext context) {
    var productnotifier = Provider.of<ProductProvider>(context);
    productnotifier.getMaleshoes();
    productnotifier.getFemaleshoes();
    productnotifier.getKidsshoes();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
          height: MediaQuery.of(context).size.height*0.4,
          decoration: BoxDecoration(image: DecorationImage
            (image: AssetImage("assets/images/top_image.png"),fit: BoxFit.cover),),
          child: Container(width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Sports Shoes",style: Appstyle().appstylewithht(42, Colors.white, FontWeight.bold, 1.5),),
            Text("Collection",style: Appstyle().appstylewithht(41, Colors.white, FontWeight.bold, 1.2)),
              TabBar(
                  indicatorSize:TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  labelStyle: Appstyle().appstyle(20, Colors.white,FontWeight.bold),
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.withOpacity(0.4),
                  tabs: const [
                    Tab(text: "Men Shoes",),
                    Tab(text: "Women Shoes",),
                    Tab(text: "Kids Shoes",)
                  ]),
          ],),),),

          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(padding: EdgeInsets.only(left: 14),
              child: TabBarView(
                controller: _tabController,
                  children: [
                    Hometabbarwidget(male: productnotifier.male,tabindex: 0,),
                    Hometabbarwidget(male: productnotifier.female,tabindex: 1,),
                    Hometabbarwidget(male: productnotifier.kids,tabindex: 2,),
                  ]),
            ),
          )
        ],),
      ),
    );
  }
}



