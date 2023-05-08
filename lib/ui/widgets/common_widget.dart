import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/utils/constants.dart';

SizedBox spacing2 = const SizedBox(height: 2);
SizedBox spacing4 = const SizedBox(height: 4);
SizedBox spacing6 = const SizedBox(height: 6);
SizedBox spacing8 = const SizedBox(height: 8);
SizedBox spacing10 = const SizedBox(height: 10);
SizedBox spacing12 = const SizedBox(height: 12);
SizedBox spacing16 = const SizedBox(height: 16);
SizedBox spacing20 = const SizedBox(height: 20);
SizedBox spacing30 = const SizedBox(height: 30);
SizedBox spacing40 = const SizedBox(height: 40);

SizedBox spacing2Width = const SizedBox(width: 2);
SizedBox spacing4Width = const SizedBox(width: 4);
SizedBox spacing8Width = const SizedBox(width: 8);
SizedBox spacing10Width = const SizedBox(width: 10);
SizedBox spacing12Width = const SizedBox(width: 12);
SizedBox spacing14Width = const SizedBox(width: 14);
SizedBox spacing16Width = const SizedBox(width: 16);

Center loadingWidget = const Center(
  child: SizedBox(
    height: 20,
    width: 20,
    child: CupertinoActivityIndicator(
      radius: 8,
      color: BrandColor.cBlueColor,
    ),
  ),
);

SnackBar snackBarError(String message) => SnackBar(
      backgroundColor: BrandColor.cRedColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lCircularBorder),
      ),
      content: Row(
        children: [
          Expanded(
            child: H5(
              text: message,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

SnackBar snackBarSucced(String message) => SnackBar(
      backgroundColor: BrandColor.cGreenColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(lCircularBorder),
      ),
      content: Row(
        children: [
          Expanded(
            child: H5(
              text: message,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
