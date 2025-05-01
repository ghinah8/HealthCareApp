// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../media_query_service.dart';
import 'app_colors.dart';

class FontStyles {
  //splash screen
  //healthcare
  static final appname = GoogleFonts.poppins(
    color: Mycolor.navyblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 8, //32 الحجم النسبي
  );
  //medicalapp
  static final underappname = GoogleFonts.poppins(
    color: Mycolor.navyblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5, //14 الحجم النسبي
  );
  //splash screen
  //find alot of specialist doctors.........
  static final title = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5.5, //22 الحجم النسبي
  );
  //skip
  static final skip = GoogleFonts.poppins(
    color: Mycolor.skipcolor,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5, //14 الحجم النسبي
  );
  //onboardring 3
  //healthcare
  static final healthcare = GoogleFonts.poppins(
    color: Mycolor.navyblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 6.25, //25 الحجم النسبي
  );
  //let's get started!
  static final letsgetstarted = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5.5, // الحجم النسبي22
  );
  //login to stay healthy and fit
  static final logintostayhealthy = GoogleFonts.poppins(
    color: Mycolor.skipcolor.withOpacity(0.6),
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, //16 الحجم النسبي
  );
  //log in
  static final loginbutton = GoogleFonts.inter(
    color: Mycolor.white,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  //sgin up
  static final sginupbutton = GoogleFonts.inter(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  //auth screen
  //title
  static final authtitle = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5, //18 الحجم النسبي
  );
  //hint text
  static final hinttext = GoogleFonts.poppins(
    color: Mycolor.grey.withOpacity(0.4),
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5, // الحجم النسبي
  );
  //don't have an account  & already have an account
  static final haveanaccount = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5, // 14الحجم النسبي
  );
  //sgin in & sgin up textbutton
  static final authtextbutton = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5, // الحجم النسبي
  );
  //forget password
  static final forgetpassword = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.5, // الحجم النسبي
  );
  //or
  static final ortext = GoogleFonts.poppins(
    color: Mycolor.skipcolor,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  //sgin in with google & facebook
  static final sgininanotherway = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  //home page
  //welcome!
  static final welcome = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final rucita = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w300,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final howisitgoingtoday = GoogleFonts.poppins(
    color: Mycolor.grey.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final searchbarText = GoogleFonts.poppins(
    color: Mycolor.grey.withOpacity(0.7),
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3, // الحجم النسبي
  );
  static final categoriess = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final healthyartical = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5.5, // الحجم النسبي
  );
  static final seeall = GoogleFonts.inter(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4.5, // الحجم النسبي
  );
  static final articalcontant = GoogleFonts.poppins(
    color: Mycolor.lightgrey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5, // الحجم النسبي
  );
  static final articaltime = GoogleFonts.poppins(
    color: Mycolor.grey.withOpacity(0.4),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 2.8, // الحجم النسبي
  );
  static final profilename = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final heartrat = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3, // الحجم النسبي
  );
  static final heartratnumber = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final profiledetails = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // 16الحجم النسبي
  );
  static final navbar = GoogleFonts.poppins(
    color: Mycolor.grey.withAlpha(120),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.3, // 16الحجم النسبي
  );
//pharmacy screen
  static final pharmacy = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // 16الحجم النسبي
  );
  static final pharmacyupload = GoogleFonts.poppins(
    color: Mycolor.white,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4, // 16الحجم النسبي
  );

  static final popularproduct = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 5, // 16الحجم النسبي
  );
  static final medicinename = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.8, // 16الحجم النسبي
  );
  //patient detailes
  static final year = GoogleFonts.poppins(
    color: Mycolor.grey.withAlpha(20),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4, // 16الحجم النسبي
  );
  static final healthcaretitle = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 7, // 16الحجم النسبي
  );
  static final longtitle = GoogleFonts.nunito(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5, // 16الحجم النسبي
  );
  static final questionhealthcare = GoogleFonts.nunito(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // 16الحجم النسبي
  );
  static final yesnoanswer = GoogleFonts.nunito(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5, // 16الحجم النسبي
  );
  static final lablepatientname = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final medicinename2 = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final medicinumber = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final price = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 6, // الحجم النسبي
  );
  static final description = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final descriptiondetails = GoogleFonts.poppins(
    color: Mycolor.lightgrey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final buy = GoogleFonts.poppins(
    color: Mycolor.white,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  //cart screen
  static final cartmidicinename = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final paymentdetail = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final taxes = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final totalprice = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final iagree = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final thankyou = GoogleFonts.rubik(
    color: Mycolor.darkgrey,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 7, // الحجم النسبي
  );
  static final underthankyou = GoogleFonts.rubik(
    color: Mycolor.blue,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final confirmyouraddress = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final address = GoogleFonts.poppins(
    color: Mycolor.grey.withAlpha(100),
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final weekday = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final weekendday = GoogleFonts.poppins(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final availabletime = GoogleFonts.rubik(
    color: Mycolor.darkgrey,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final time = GoogleFonts.rubik(
    color: Mycolor.lightblue,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5, // الحجم النسبي
  );
  static final heartrate = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final heatpbm = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 8, // الحجم النسبي
  );
  static final latestreport = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 5, // الحجم النسبي
  );
  static final generalreport = GoogleFonts.poppins(
    color: Mycolor.grey,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4, // الحجم النسبي
  );
  static final date = GoogleFonts.poppins(
    color: Mycolor.grey.withAlpha(102),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3, // الحجم النسبي
  );
}
