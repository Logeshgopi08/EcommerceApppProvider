import 'package:ecommerceappp/Provider/Mainscreenprovider.dart';
import 'package:ecommerceappp/Screens/Cartpage.dart';
import 'package:ecommerceappp/Screens/Homepage.dart';
import 'package:ecommerceappp/Screens/Profile.dart';
import 'package:ecommerceappp/Screens/search.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/Bottonavi_widgets.dart';
import 'shared/Bootomnavibar.dart';
import 'Faovaritepage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  
  List <Widget>pages=[
    Homepage(),Searchpage(),Favaouitepage(),Cartpage(),Profile()
  ];
  @override
  Widget build(BuildContext context) {

    return Consumer<Mainscreennotifier>(builder: (context, screenvalue, child){
       return   Scaffold(
         backgroundColor: const Color(0xFFE2E2E2),
        body: pages[screenvalue.pageindex],
        bottomNavigationBar: Bottomnavibar(),

      );
    });
  }
}


