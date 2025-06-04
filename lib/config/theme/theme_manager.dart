import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static ThemeMode themeMode = ThemeMode.light;
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorsManager.blue,
      onPrimary: ColorsManager.white,
      secondary: ColorsManager.black,
      tertiary: ColorsManager.red,
      onPrimaryContainer: ColorsManager.grey,
      outline: ColorsManager.grey,

      brightness: Brightness.light,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue ,
      shape: StadiumBorder(
      side: BorderSide(
        color: ColorsManager.white ,
        width: 4 ,
      )
      )
    ), 

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blue ,
      type: BottomNavigationBarType.fixed ,
       selectedLabelStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 12 ,
        fontWeight: FontWeight.w700,
      )
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black,
      ), 
      shadowColor:Colors.transparent ,
      scrolledUnderElevation: 0 ,
    ),
    iconTheme: const IconThemeData(color: ColorsManager.grey),
    inputDecorationTheme: InputDecorationTheme(
       hintStyle: GoogleFonts.inter(
        fontSize: 18.sp,
        color: ColorsManager.offWhite,
        fontWeight: FontWeight.w500,
      ),
      iconColor: ColorsManager.grey,
      labelStyle: GoogleFonts.inter(
        fontSize: 18.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.red),
        borderRadius: BorderRadius.circular(14.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.grey, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.blue,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 18.sp,
        color: ColorsManager.black,
        fontWeight: FontWeight.w500,
      ), 
     
    ),

  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorsManager.blue,
      onPrimary: ColorsManager.darkBackground,
      secondary: ColorsManager.darkBackground,
      onPrimaryContainer: ColorsManager.blue, 
      outline: ColorsManager.offWhite,
      tertiary: ColorsManager.red,
      brightness: Brightness.dark,
    ), 
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBackground ,
      shape: StadiumBorder(
      side: BorderSide(
        color: ColorsManager.white ,
        width: 4 ,
      )
      )
    ), 

    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBackground ,
      type: BottomNavigationBarType.fixed ,
      selectedLabelStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 12 ,
        fontWeight: FontWeight.w700,
      )
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blue,
      ), 
      shadowColor:Colors.transparent ,
      scrolledUnderElevation: 0 ,
    ), 
        iconTheme: const IconThemeData(color: ColorsManager.blue),


    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.offWhite,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 18.sp,
        color: ColorsManager.offWhite,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.blue,
        fontWeight: FontWeight.bold,
      ),
    ), 
     inputDecorationTheme: InputDecorationTheme( 
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.offWhite,
        fontWeight: FontWeight.w500,
      ),
      iconColor: ColorsManager.offWhite,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.offWhite,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.blue),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.blue),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.red),
        borderRadius: BorderRadius.circular(14.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorsManager.blue, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
  );
}
