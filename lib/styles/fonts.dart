import 'package:flutter/material.dart';
import 'package:boilerplate/styles/colors.dart';

class CocktailAppFonts
{
  static const appBarTitle = TextStyle(
    color: CocktailAppColors.gray,
    fontFamily: 'Arial',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const homeTitle = TextStyle(
    color: CocktailAppColors.white,
    fontFamily: 'Arial',
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 10.0,
        color: CocktailAppColors.lightGray,
      )
    ],
  );

  static const homeText = TextStyle(
    color: CocktailAppColors.white,
    fontFamily: 'Arial',
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 10.0,
        color: CocktailAppColors.lightGray,
      )
    ],
  );

  static const menuItemLabel = TextStyle(
    color: CocktailAppColors.gray,
    fontFamily: 'Arial',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const messageText = TextStyle(
    color: CocktailAppColors.black,
    fontFamily: 'Arial',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
}
