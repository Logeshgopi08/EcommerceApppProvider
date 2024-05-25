import 'package:ecommerceappp/modal/Sneakers_modal.dart';
import 'package:flutter/services.dart' as the_bundle;

class Helper{

  //this class is to fetch data from jsonfile  and return it

  Future<List<Sneakers>> getMaledata ()async{
     final data = await the_bundle.rootBundle.loadString("assets/Json/men_shoes.json");
     final malelist = sneakersFromJson(data);
     return malelist;
  }

  Future<List<Sneakers>> getFemaledata ()async{
    final data = await the_bundle.rootBundle.loadString("assets/Json/women_shoes.json");
    final Femalelist = sneakersFromJson(data);
    return Femalelist;
  }

  Future<List<Sneakers>> getKidsdata ()async{
    final data = await the_bundle.rootBundle.loadString("assets/Json/kids_shoes.json");
    final Kidslist = sneakersFromJson(data);
    return Kidslist;
  }

  Future<Sneakers>getMaledataById(String id)async{
    final data = await the_bundle.rootBundle.loadString("assets/Json/men_shoes.json");
    final malelist = sneakersFromJson(data);
       final  sneaker = malelist.firstWhere((sneaker) => sneaker.id == id);
       return sneaker;
  }
  Future<Sneakers>getFemaledataById(String id)async{
    final data = await the_bundle.rootBundle.loadString("assets/Json/women_shoes.json");
    final Femalelist = sneakersFromJson(data);
    final  sneaker = Femalelist.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }
  Future<Sneakers>getKidsdataById(String id)async{
    final data = await the_bundle.rootBundle.loadString("assets/Json/kids_shoes.json");
    final Kidslist = sneakersFromJson(data);
    final  sneaker = Kidslist.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }
}