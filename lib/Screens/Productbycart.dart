import 'package:ecommerceappp/Screens/shared/Categorybtn.dart';
import 'package:ecommerceappp/Screens/shared/LatestShoes.dart';
import 'package:ecommerceappp/Screens/shared/staggertile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../modal/Sneakers_modal.dart';
import '../services/Helper.dart';
import '../utils/Appstyle.dart';

class Productbycart extends StatefulWidget {
   Productbycart({super.key, required this.tabindex, });
  final  int tabindex;

  @override
  State<Productbycart> createState() => _ProductbycartState();
}

class _ProductbycartState extends State<Productbycart>with TickerProviderStateMixin {
  late Future<List<Sneakers>>_male;
  late Future<List<Sneakers>>_female;
  late Future<List<Sneakers>>_kids;

  getMaleshoes(){
    _male = Helper().getMaledata();
  }
  getFemaleshoes(){
    _female = Helper().getFemaledata();
  }
  getKidsshoes(){
    _kids = Helper().getKidsdata();
  }

  List<String>brands=[
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png"
  ];

  @override
  void initState() {
    super.initState();
    getMaleshoes();
    getFemaleshoes();
    getKidsshoes();
  }

  late final TabController _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(height: MediaQuery.of(context).size.height,
        child: Stack(children: [
             Container(height: MediaQuery.of(context).size.height*0.4,
             decoration:const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/top_image.png"),
             fit: BoxFit.fill)),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(16,45,16,8),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [GestureDetector(onTap:(){
                     Navigator.pop(context);
                   },
                     child: Icon(Icons.close,color: Colors.white,)),
                   InkWell(onTap: (){filter();},
                       child: Icon(FontAwesomeIcons.sliders,color: Colors.white,))
                 ],),
               ),
                 TabBar(
                     indicatorSize:TabBarIndicatorSize.tab,
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
                     ])
             ],),),
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,left: 8,right: 8),
                        child: ClipRRect(borderRadius: BorderRadius.circular(16),
                          child: TabBarView(controller: _tabController,
                            children: [
                                  Latestshoes(male: _male,),
                              Latestshoes(male: _female),
                              Latestshoes(male: _kids),
                            ]),
                        ),
                      )

        ],),
      ),
    );
  }
  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.84,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 5,
              //   width: 40,
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //     color: Colors.black38,
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                  const SizedBox(
                  height: 10,
                ),
                    Text(
                      "Filter",
                      style: Appstyle().appstyle(40, Colors.black, FontWeight.bold),
                    ),
                const SizedBox(
                  height: 20,
                ),
                    Text(
                      "Gender",
                      style:Appstyle().appstyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        CategoryBtn(
                          label: "Men",
                          buttonClr: Colors.black,
                        ),
                        CategoryBtn(
                          label: "Women",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Kids",
                          buttonClr: Colors.grey,
                        ),
                      ],
                    ),
                const SizedBox(
                  height: 25,
                ),
                    Text(
                      "Category",
                      style: Appstyle().appstyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        CategoryBtn(
                          label: "Shoes",
                          buttonClr: Colors.black,
                        ),
                        CategoryBtn(
                          label: "Apparrels",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Accessories",
                          buttonClr: Colors.grey,
                        ),
                      ],
                    ),

                    Text(
                      "Price",
                      style:Appstyle().appstyle(20, Colors.black, FontWeight.bold),
                    ),
                const SizedBox(
                  height: 20,
                ),
                    Slider(
                        value: _value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: _value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double value) {}),
                    const SizedBox(height: 20,),
                    Text(
                      "Brand",
                      style: Appstyle().appstyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 80,
                        child: ListView.builder(
                            itemCount: brands.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset(
                                    brands[index],
                                    height: 60,
                                    width: 80,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

