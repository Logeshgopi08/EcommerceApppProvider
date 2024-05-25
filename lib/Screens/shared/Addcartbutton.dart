import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Appstyle.dart';

class Addcartbutton extends StatelessWidget {
  const Addcartbutton({
    super.key, required this.label, required this.ontap,
  });
  final String label;
    final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ontap,
      child: Container(width: MediaQuery.of(context).size.width,
        height: 50,decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(18)),child:
        Center(child: Text(label,style: Appstyle().appstyle(17, Colors.white, FontWeight.bold),)),),
    );
  }
}
