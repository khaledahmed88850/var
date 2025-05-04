import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/view/widgets/whoami_view_body.dart';

class WhoamiView extends StatelessWidget {
  const WhoamiView({super.key});
  static const String routeName = '/whoami';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'من انا', context: context),

      body: const WhoamiViewBody(),
    );
  }
}
