import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

AppBar buildAppBar({
  void Function()? onPressed,
  required BuildContext context,
  required String title,
  arrowBackExist = true,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Visibility(
        visible: arrowBackExist,
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
    ),
    title: Text(title, style: Styles.bold28),
  );
}
