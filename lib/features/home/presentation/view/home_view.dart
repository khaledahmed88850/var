import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
