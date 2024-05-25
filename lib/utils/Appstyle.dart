import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
class Appstyle {

  TextStyle appstyle (double size,Color _color,FontWeight fw){
    return GoogleFonts.poppins(fontSize: size,color: _color,fontWeight:fw);
  }
  TextStyle appstylewithht(double size,Color _color,FontWeight fw, double ht){
    return GoogleFonts.poppins(fontSize: size,color: _color,fontWeight:fw,height: ht);
  }

}