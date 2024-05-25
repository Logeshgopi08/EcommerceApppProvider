import 'package:flutter/cupertino.dart';

import '../modal/Sneakers_modal.dart';
import '../services/Helper.dart';


class ProductProvider extends ChangeNotifier{

  int _activepage = 0;
  List<dynamic>_shoesize=[];
  List<String>_sizes=[];


    int get activepage => _activepage;
      set activepage(newpage){
      _activepage= newpage;
        notifyListeners();
    }

    List<dynamic>get shoesize =>_shoesize;

      set shoesize(List<dynamic>newshoesize){
        _shoesize = newshoesize;
        notifyListeners();
      }

      void check(int index){
        for(int i=0;i<_shoesize.length;i++){
          if(i==index){
            _shoesize[i]['isSelected'] = !_shoesize[i]['isSelected'];
          }
          notifyListeners();
        }
      }
      List<String> get sizes =>_sizes;
      set sizes(newsize){
        _sizes = newsize;
        notifyListeners();
      }


  late Future<List<Sneakers>>male;
  late Future<List<Sneakers>>female;
  late Future<List<Sneakers>>kids;

  getMaleshoes(){
    male = Helper().getMaledata();
  }
  getFemaleshoes(){
    female = Helper().getFemaledata();
  }
  getKidsshoes(){
    kids = Helper().getKidsdata();
  }

  late  Future<Sneakers>sneaker;


  getshoes(String category,String id){
    if(category == "Men's Running"){
      return sneaker = Helper().getMaledataById(id);
    }else if(id == "Women's Running"){
      return sneaker = Helper().getFemaledataById(id);
    }else {
      return  sneaker = Helper().getKidsdataById(id);
    }


  }
}