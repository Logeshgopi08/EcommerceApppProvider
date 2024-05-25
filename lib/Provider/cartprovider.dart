import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier{

  final cartbox = Hive.box('cart_box');
  List<dynamic>_cart= [];

  //This methos is create cart
  Future <void> createcart(Map<dynamic,dynamic>newcart)async{
    await cartbox.add(newcart);
    notifyListeners();
  }
  // this is to retrive the data
  List<dynamic> get cart =>_cart;
  set cart(List<dynamic>newcart){
    _cart = newcart;
    notifyListeners();
  }
  getcartdata(){
    final cartData = cartbox.keys.map((key) {
      final item = cartbox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    cart = cartData.reversed.toList();
    notifyListeners();

  }

}