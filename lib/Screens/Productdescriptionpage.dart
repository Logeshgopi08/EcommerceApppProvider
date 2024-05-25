import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceappp/Provider/ProductProvider.dart';
import 'package:ecommerceappp/Provider/cartprovider.dart';
import 'package:ecommerceappp/Provider/favouriteprovider.dart';
import 'package:ecommerceappp/Screens/Faovaritepage.dart';
import 'package:ecommerceappp/Screens/shared/Addcartbutton.dart';
import 'package:ecommerceappp/services/Helper.dart';
import 'package:ecommerceappp/utils/Appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../modal/Sneakers_modal.dart';

class ProductDescriptionPage extends StatefulWidget {
   ProductDescriptionPage({super.key, required this.id, required this.category});
  final String id;
  final String category;

  @override
  State<ProductDescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  final PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    var favouritenotifire = Provider.of<FavouriteProvider>(context,listen: true);
    favouritenotifire.getfav();
    var cartnotifier = Provider.of<CartProvider>(context);
    var productnotifier = Provider.of<ProductProvider>(context);
    productnotifier.getshoes(widget.category, widget.id);

    return Scaffold(

      body: FutureBuilder(future: productnotifier.sneaker,
      builder: (context,snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if (snapshot.hasError){
          return Text("${snapshot.error}");
        }else {
          final sneaker = snapshot.data;
          return Consumer<ProductProvider>(builder: (context,productnotifier,child){
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomScrollView(slivers: [
                SliverAppBar(automaticallyImplyLeading: false,leadingWidth: 0,
                  title:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [InkWell(onTap: (){
                      Navigator.pop(context);
                      productnotifier.shoesize.clear();
                    },
                        child: Icon(Icons.close,color: Colors.black,)),
                      Icon(Icons.more_horiz,color: Colors.black,)],),
                  pinned: true,floating: true,backgroundColor: Colors.transparent,

                  expandedHeight: MediaQuery.of(context).size.height,
                  flexibleSpace: FlexibleSpaceBar(background: Stack(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _pagecontroller,
                          onPageChanged: (page){
                            productnotifier.activepage= page;
                          },
                          itemCount: sneaker!.imageUrl.length,
                          itemBuilder: (context,index){
                            return Stack(children: [
                              Container(height: MediaQuery.of(context).size.height*0.36,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey.shade200,
                                child: CachedNetworkImage(imageUrl:sneaker.imageUrl[index],fit: BoxFit.contain,),
                              ),
                              Positioned(top: MediaQuery.of(context).size.height*0.1,right:18,
                                  child: Consumer<FavouriteProvider>(builder: (context,favouritenotifire,child){
                                    return InkWell(
                                        onTap:(){
                                          setState(() {
                                            if(favouritenotifire.ids.contains(widget.id)){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                  Favaouitepage()));
                                            }else{
                                             favouritenotifire.createFav({
                                                'id':sneaker.id,
                                                'name':sneaker.name,
                                                'price':sneaker.price,
                                                'category':sneaker.category,
                                                'imageUrl':sneaker.imageUrl[0]
                                              });
                                            }setState(() {

                                            });
                                          });
                                        },
                                        child: favouritenotifire.ids.contains(widget.id)?Icon(Icons.favorite):Icon(Icons.favorite_border));
                                  },)),
                              Positioned(
                                  bottom: 0,left: 0,right: 0,
                                  height: MediaQuery.of(context).size.height*0.3,
                                  child: Row(mainAxisAlignment:MainAxisAlignment.center,
                                      children:
                                  List<Widget>.generate(sneaker.imageUrl.length, (index) => Padding(padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),child: CircleAvatar(radius: 5,
                                      backgroundColor: productnotifier.activepage != index?Colors.grey:Colors.black,))
                                    ,))
                              ),

                            ],);
                          },
                        ),),
                      Positioned(bottom: 30,
                        child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(18),
                        topLeft: Radius.circular(18)),
                          child: Container(height: MediaQuery.of(context).size.height*0.6,
                            width: MediaQuery.of(context).size.width,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(sneaker.name,style: Appstyle().appstyle(18, Colors.black, FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text(sneaker.category,style:Appstyle().appstyle(18, Colors.black, FontWeight.bold) ,),
                                SizedBox(height: 10,),
                                Text(sneaker.price,style: Appstyle().appstyle(20, Colors.black, FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("Select Sizes",style: Appstyle().appstyle(18, Colors.red, FontWeight.w400),),
                                SizedBox(height: 40,
                                child: ListView.builder(itemCount: productnotifier.shoesize.length,
                                shrinkWrap: true,scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  final sizes =
                                  productnotifier
                                      .shoesize[
                                  index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6),
                                    child: ChoiceChip(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),
                                      side: BorderSide(color: Colors.black)),
                                    label: Text(productnotifier.shoesize[index]['size'],
                                    style: Appstyle().appstyle(12,
                                        productnotifier.shoesize[index]['isSelected']?Colors.white:Colors.black, FontWeight.w200)
                                      ,), selectedColor: Colors.black,disabledColor: Colors.white
                                        ,selected: productnotifier.shoesize[index]['isSelected'],
                                    onSelected: (newstate){
                                        if(productnotifier.sizes.contains(sizes['size'])){
                                          productnotifier.sizes.remove(sizes['size']);
                                        }else {
                                          productnotifier.sizes.add(sizes['size']);
                                        }
                                        print(productnotifier.sizes);
                                        productnotifier.check(index);
                                    },),
                                  );
                                },),),

                                SizedBox(height: 10,),
                                Text(sneaker.title,style: Appstyle().appstyle(20, Colors.black, FontWeight.w600),),
                                Text(sneaker.description,style: Appstyle().appstyle(18, Colors.grey, FontWeight.w300),
                                maxLines: 4,),
                                SizedBox(height: 10,),
                                Addcartbutton(
                                  label: "Add to cart",
                                  ontap: ()async{
                                      cartnotifier.createcart({
                                         "id" :sneaker.id,
                                         "name":sneaker.name,
                                         "category":sneaker.category,
                                         "price":sneaker.price,
                                         "imageUrl":sneaker.imageUrl[0],
                                         "qty":1,
                                         "sizes":productnotifier.sizes[0]
                                       });
                                       print(sneaker.name);
                                       productnotifier.sizes.clear();
                                       Navigator.pop(context);
                                  },
                                )
                              ],),),
                        ),)
                    ],),),
                )
              ],),
            );
          },);
        }
      },)
    );
  }
}

