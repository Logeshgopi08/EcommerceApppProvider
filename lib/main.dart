
import 'package:ecommerceappp/Provider/ProductProvider.dart';
import 'package:ecommerceappp/Provider/cartprovider.dart';
import 'package:ecommerceappp/Provider/favouriteprovider.dart';
import 'package:ecommerceappp/Screens/Cartpage.dart';
import 'package:ecommerceappp/Screens/Homepage.dart';
import 'package:ecommerceappp/Screens/Mainpage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // Import for FontFeature

import 'Provider/Mainscreenprovider.dart';
import 'Screens/Productbycart.dart';
import 'Screens/Productdescriptionpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   await Hive.openBox("cart_box");
   await Hive.openBox("fav_box");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>Mainscreennotifier()),
    ChangeNotifierProvider(create: (context)=>ProductProvider()),
    ChangeNotifierProvider(create: (context)=>FavouriteProvider()),
    ChangeNotifierProvider(create: (context)=>CartProvider())
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Mainpage() ,
    );
  }
}


