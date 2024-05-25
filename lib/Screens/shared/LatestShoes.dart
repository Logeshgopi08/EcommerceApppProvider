import 'package:ecommerceappp/Screens/shared/staggertile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../modal/Sneakers_modal.dart';

class Latestshoes extends StatelessWidget {
  const Latestshoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(future: _male, builder:(context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      }else if (snapshot.hasError){
        return Text("${snapshot.error}");
      }else {
        final male = snapshot.data;
        return StaggeredGridView.countBuilder(crossAxisCount: 2,itemCount: male!.length,
          crossAxisSpacing: 10,mainAxisSpacing: 10,
          staggeredTileBuilder:
              (index)=>StaggeredTile.extent(
              (index % 2 == 0)?1 :1,
                  (index% 4== 1 || index%4 ==3) ?MediaQuery.of(context).size.height*0.37
                      : MediaQuery.of(context).size.height*0.33),

          itemBuilder: ( context,  index) {
            final shoes = snapshot.data![index];
            return Staggerrtile(imageUrl: shoes.imageUrl[1],
              name: shoes.name,price: shoes.price,);
          },


        );
      }
    });
  }
}