 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottom_naviwidget extends StatelessWidget {
  final void Function ()?ontap;
  final IconData ? icon;
   const Bottom_naviwidget({super.key, this.ontap, this.icon});

   @override
   Widget build(BuildContext context) {
     return InkWell(
       onTap: ontap,
       child: SizedBox(
         height: 35,width: 35,
         child: Icon(icon,color: Colors.white,),
       ),
     );
   }
 }
