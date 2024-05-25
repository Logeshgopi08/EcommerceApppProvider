import 'package:flutter/cupertino.dart';

class Mainscreennotifier extends ChangeNotifier{
   int _pageIndex =0;
   int  get pageindex => _pageIndex;
   set pageindex (int newindex){
     _pageIndex = newindex;
     notifyListeners();
   }

}