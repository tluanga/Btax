import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

double cardBorderRadius = 10.0;
Color selectedTextColor =
    Colors.black54; //const Color.fromRGBO(247, 192, 13, 1);
Color textColor = Colors.grey.shade800;
Color iconColor = Colors.grey.shade900;
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double drawerIconSize = 23.0;
Color drawerIconColor = Colors.grey.shade800;
Color drawerTextColor = Colors.grey.shade900;

///
///
Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
String? fontFamilyBoldGlobal;
String? fontFamilyPrimaryGlobal;
String? fontFamilySecondaryGlobal;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;

Color appBarBackgroundColorGlobal = Colors.white;
Color appButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
double defaultAppButtonRadius = 8.0;
double defaultAppButtonElevation = 4.0;
bool enableAppButtonScaleAnimationGlobal = true;
int? appButtonScaleAnimationDurationGlobal;
ShapeBorder? defaultAppButtonShapeBorder;

Color defaultLoaderBgColorGlobal = Colors.white;
Color? defaultLoaderAccentColorGlobal;

Color? defaultInkWellSplashColor;
Color? defaultInkWellHoverColor;
Color? defaultInkWellHighlightColor;
double? defaultInkWellRadius;

Color shadowColorGlobal = Colors.grey.withOpacity(0.2);
int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

int passwordLengthGlobal = 6;

// late SharedPreferences sharedPreferences;

// ShapeBorder? defaultDialogShape;

// String defaultCurrencySymbol = currencyRupee;

// LanguageDataModel? selectedLanguageDataModel;
// List<LanguageDataModel> localeLanguageList = [];

// // Toast Config
// Color defaultToastBackgroundColor = Colors.grey.shade200;
// Color defaultToastTextColor = Colors.black;
// ToastGravity defaultToastGravityGlobal = ToastGravity.CENTER;
// BorderRadius defaultToastBorderRadiusGlobal = radius(30);
// //endregion

// // Must be initialize before using shared preference
// Future<void> initialize({
//   double? defaultDialogBorderRadius,
//   List<LanguageDataModel>? aLocaleLanguageList,
// }) async {
//   sharedPreferences = await SharedPreferences.getInstance();

//   defaultAppButtonShapeBorder =
//       RoundedRectangleBorder(borderRadius: radius(defaultAppButtonRadius));

//   defaultDialogShape = dialogShape(defaultDialogBorderRadius);

//   localeLanguageList = aLocaleLanguageList ?? [];
// }

class NBUtils {
  static const MethodChannel _channel = const MethodChannel('nb_utils');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
