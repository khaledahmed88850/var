import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/bank_challenge_helper_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../cubits/bank_challenge_cubit/bank_challenge_cubit.dart';
import 'bank_page_view_item.dart';

class BankPageViewBlocBuilder extends StatelessWidget {
  const BankPageViewBlocBuilder({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankChallengeCubit, BankChallengeState>(
      builder: (context, state) {
        if (state is BankChallengeSuccess) {
          return BankPageViewItem(
            index: index,
            bankChallengeModelList: state.bankChallengeModelList,
          );
        } else if (state is BankChallengeFailure) {
          return Center(child: Text(state.message));
        } else {
          return Skeletonizer(
            child: BankPageViewItem(
              isDummy: true,
              index: index,
              bankChallengeModelList: dummyBankChallengeModelListList,
            ),
          );
        }
      },
    );
  }
}
