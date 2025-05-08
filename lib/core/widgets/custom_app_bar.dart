import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  arrowBackExist = true,
  void Function()? onPressed,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Visibility(
        visible: arrowBackExist,
        child: const Icon(Icons.arrow_back_ios),
      ),
      onPressed: onPressed,
    ),
    title: Text(title, style: Styles.bold28),
  );
}
