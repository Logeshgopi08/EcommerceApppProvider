import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavouriteProvider extends ChangeNotifier{
  final _favbox= Hive.box("fav_box");
  List <dynamic>_ids=[];
  List <dynamic>_favourite = [];
  List<dynamic>_favor=[];

  List<dynamic>get ids =>_ids;

  set ids (List<dynamic>newIds){
       _ids = newIds;
       notifyListeners();
  }

  List<dynamic>get favourite =>_favourite;
  set favourite (List<dynamic>newFavourite){
    _favourite = newFavourite;
    notifyListeners();
  }


  Future<void> createFav(Map<String,dynamic>addFav)async{
    await _favbox.add(addFav);
  }


  getfav(){
    final favData = _favbox.keys.map((key){
      final item = _favbox.get(key);
      return {
        "key":key,
        "id":item['id']
      };
    }).toList();
    _favourite = favData.toList();
    ids = _favourite.map((item)=>item['id']).toList();
    notifyListeners();
  }

  // create get set methods for retrieving data in favorurite page
  List<dynamic>get favor =>_favor;
  set favor(List<dynamic>newfavor){
     _favor = newfavor;
     notifyListeners();
  }

  getfavdata(){
    final favData = _favbox.keys.map((key){
      final item = _favbox.get(key);
      return{
        "key":key,
        "id":item['id'],
        "name":item['name'],
        "price":item['price'],
        "imageUrl":item['imageUrl'],
        "category":item['category']
      };
    }).toList();

    favor = favData.reversed.toList();
    ids = favor.map((item)=>item['id']).toList();

  }

  Future<void> deletefav(int key)async{
    await _favbox.delete(key);
    notifyListeners();
  }


}