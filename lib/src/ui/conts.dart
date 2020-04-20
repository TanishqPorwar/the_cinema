import 'package:flutter/material.dart';

class FONT_CONST {
  static final REGULAR = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: COLOR_CONST.BLACK);

  static final MEDIUM = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: COLOR_CONST.BLACK,
  );

  static final SEMIBOLD = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: COLOR_CONST.BLACK,
  );

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.DEFAULT);
  static final REGULAR_DEFAULT_10 = REGULAR_DEFAULT.copyWith(fontSize: 10);
  static final REGULAR_DEFAULT_12 = REGULAR_DEFAULT.copyWith(fontSize: 12);

  static final REGULAR_WHITE = REGULAR.copyWith(color: COLOR_CONST.WHITE);
  static final REGULAR_WHITE_8 = REGULAR_WHITE.copyWith(fontSize: 8);
  static final REGULAR_WHITE_10 = REGULAR_WHITE.copyWith(fontSize: 10);
  static final REGULAR_WHITE_12 = REGULAR_WHITE.copyWith(fontSize: 12);
  static final REGULAR_WHITE_14 = REGULAR_WHITE.copyWith(fontSize: 14);

  static final REGULAR_GRAY1 = REGULAR.copyWith(color: COLOR_CONST.GRAY1);
  static final REGULAR_GRAY1_10 = REGULAR_GRAY1.copyWith(fontSize: 10);
  static final REGULAR_GRAY1_12 = REGULAR_GRAY1.copyWith(fontSize: 12);

  static final REGULAR_GRAY1_50 = REGULAR.copyWith(color: COLOR_CONST.GRAY1_50);
  static final REGULAR_GRAY1_50_9 = REGULAR_GRAY1_50.copyWith(fontSize: 9);
  static final REGULAR_GRAY1_50_12 = REGULAR_GRAY1_50.copyWith(fontSize: 12);

  static final REGULAR_BLACK2 = REGULAR.copyWith(color: COLOR_CONST.BLACK2);
  static final REGULAR_BLACK2_10 = REGULAR_BLACK2.copyWith(fontSize: 10);
  static final REGULAR_BLACK2_12 = REGULAR_BLACK2.copyWith(fontSize: 12);
  static final REGULAR_BLACK2_14 = REGULAR_BLACK2.copyWith(fontSize: 14);

  static final REGULAR_GRAY4 = REGULAR.copyWith(color: COLOR_CONST.GRAY4);
  static final REGULAR_GRAY4_8 = REGULAR_GRAY4.copyWith(fontSize: 8);
  static final REGULAR_GRAY4_10 = REGULAR_GRAY4.copyWith(fontSize: 10);
  static final REGULAR_GRAY4_12 = REGULAR_GRAY4.copyWith(fontSize: 12);
  static final REGULAR_GRAY4_14 = REGULAR_GRAY4.copyWith(fontSize: 14);

  static final REGULAR_GRAY4_40 = REGULAR.copyWith(color: COLOR_CONST.GRAY4_40);
  static final REGULAR_GRAY4_40_12 = REGULAR_GRAY4_40.copyWith(fontSize: 12);

  static final REGULAR_GRAY5 = REGULAR.copyWith(color: COLOR_CONST.GRAY5);
  static final REGULAR_GRAY5_10 = REGULAR_GRAY5.copyWith(fontSize: 10);

  static final REGULAR_GRAY6 = REGULAR.copyWith(color: COLOR_CONST.GRAY6);
  static final REGULAR_GRAY6_10 = REGULAR_GRAY6.copyWith(fontSize: 10);
  static final REGULAR_GRAY6_12 = REGULAR_GRAY6.copyWith(fontSize: 12);

  static final REGULAR_BLUE = REGULAR.copyWith(color: COLOR_CONST.BLUE);
  static final REGULAR_BLUE_14 = REGULAR_BLUE.copyWith(fontSize: 14);
  static final REGULAR_BLUE_16 = REGULAR_BLUE.copyWith(fontSize: 16);

  //MEDIUM
  static final MEDIUM_WHITE = MEDIUM.copyWith(color: COLOR_CONST.WHITE);
  static final MEDIUM_WHITE_12 = MEDIUM_WHITE.copyWith(fontSize: 12);
  static final MEDIUM_WHITE_14 = MEDIUM_WHITE.copyWith(fontSize: 14);
  static final MEDIUM_WHITE_16 = MEDIUM_WHITE.copyWith(fontSize: 16);
  static final MEDIUM_WHITE_22 = MEDIUM_WHITE.copyWith(fontSize: 22);

  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.DEFAULT);
  static final MEDIUM_DEFAULT_10 = MEDIUM_DEFAULT.copyWith(fontSize: 10);
  static final MEDIUM_DEFAULT_12 = MEDIUM_DEFAULT.copyWith(fontSize: 12);
  static final MEDIUM_DEFAULT_14 = MEDIUM_DEFAULT.copyWith(fontSize: 14);
  static final MEDIUM_DEFAULT_16 = MEDIUM_DEFAULT.copyWith(fontSize: 16);

  static final MEDIUM_WHITE_70 = MEDIUM.copyWith(color: COLOR_CONST.WHITE_70);
  static final MEDIUM_WHITE_70_14 = MEDIUM_WHITE_70.copyWith(fontSize: 14);

  static final MEDIUM_GRAY4 = MEDIUM.copyWith(color: COLOR_CONST.GRAY4);
  static final MEDIUM_GRAY4_10 = MEDIUM_GRAY4.copyWith(fontSize: 10);

  static final MEDIUM_BLACK2 = MEDIUM.copyWith(color: COLOR_CONST.BLACK2);
  static final MEDIUM_BLACK2_14 = MEDIUM_BLACK2.copyWith(fontSize: 14);
  static final MEDIUM_BLACK2_16 = MEDIUM_BLACK2.copyWith(fontSize: 16);

  static final MEDIUM_BLUE = MEDIUM.copyWith(color: COLOR_CONST.BLUE);
  static final MEDIUM_BLUE_14 = MEDIUM_BLUE.copyWith(fontSize: 14);
  static final MEDIUM_BLUE_16 = MEDIUM_BLUE.copyWith(fontSize: 16);

  //SEMI_BOLD
  static final SEMIBOLD_WHITE = SEMIBOLD.copyWith(color: COLOR_CONST.WHITE);
  static final SEMIBOLD_WHITE_10 = SEMIBOLD_WHITE.copyWith(fontSize: 10);
  static final SEMIBOLD_WHITE_16 = SEMIBOLD_WHITE.copyWith(fontSize: 16);
  static final SEMIBOLD_WHITE_18 = SEMIBOLD_WHITE.copyWith(fontSize: 18);

  //OSWALD
  static final OSWALD_REGULAR = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.w400,
  );

  static final OSWALD_REGULAR_RED2 =
      OSWALD_REGULAR.copyWith(color: COLOR_CONST.RED2);
  static final OSWALD_REGULAR_RED2_12 =
      OSWALD_REGULAR_RED2.copyWith(fontSize: 12);
}

class COLOR_CONST {
  //https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4

  static final HexColor DEFAULT = new HexColor("#E81667");
  static final HexColor DEFAULT_5 = new HexColor("#0DE81667");
  static final HexColor RED = new HexColor("#F93F3E");
  static final HexColor RED2 = new HexColor("#D05045");
  static final HexColor GREEN = new HexColor("#2EC492");
  static final HexColor GREEN2 = new HexColor("#8CC153");
  static final HexColor ORANGE = new HexColor("#EB8D2F");
  static final HexColor WHITE = new HexColor("#FFFFFF");
  static final HexColor WHITE_70 = new HexColor("#B3FFFFFF");
  static final HexColor BLACK = new HexColor("#000000");
  static final HexColor BLACK2 = new HexColor("#333333");
  static final HexColor BLACK_30 = new HexColor("#4D000000");
  static final HexColor GRAY1 = new HexColor("#999999");
  static final HexColor GRAY1_50 = new HexColor("#80999999");
  static final HexColor GRAY1_70 = new HexColor("#B3999999");
  static final HexColor GRAY2 = new HexColor("#F8F8F8");
  static final HexColor GRAY3 = new HexColor("#F4F4F4");
  static final HexColor GRAY4 = new HexColor("#666666");
  static final HexColor GRAY4_40 = new HexColor("#66666666");
  static final HexColor GRAY5 = new HexColor("#C1C1C1");
  static final HexColor GRAY6 = new HexColor("#707070");
  static final HexColor GRAY7 = new HexColor("#DDDDDD");
  static final HexColor ITEM_BG = new HexColor("#F3F6F8");
  static final HexColor BLUE = new HexColor("#222539");
  static final HexColor DIVIDER = new HexColor("#33000000");
  static final HexColor TRANS = new HexColor("00000000");
  static final HexColor DEFAULT_BORDER = new HexColor("#E5E5E5");

  static final HexColor GOOGLE_BTN = new HexColor("#FFF1F0");
  static final HexColor GOOGLE_BORDER_BTN = new HexColor("#F14336");
  static final HexColor FACEBOOK_BTN = new HexColor("#F5F9FF");
  static final HexColor FACEBOOK_BORDER_BTN = new HexColor("#3164CE");
  static final HexColor TAG_BG = new HexColor("#FFE5EF");
  static final HexColor GIFT_BG1 = new HexColor("#FCCAC6");
  static final HexColor GIFT_BG2 = new HexColor("#2687D57E");
  static final HexColor TIME_SLOT_BG = new HexColor("#424242");
  static final HexColor TIME_SLOT_BORDER = new HexColor("#424242");
  static final HexColor SEAT_SLOT_BG_BOOKED = new HexColor("#424242");
  static final HexColor SEAT_SLOT_BG = new HexColor("#FFFFFF");
  static final HexColor SEAT_SLOT_BORDER = new HexColor("#707070");

  static final MaterialColor STATUS_BAR = MaterialColor(0xFF2E3147, {});
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
