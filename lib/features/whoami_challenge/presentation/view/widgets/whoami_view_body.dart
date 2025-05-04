import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/cubit/whoami_cubit.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/view/widgets/clue_item.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/view/widgets/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoamiViewBody extends StatefulWidget {
  const WhoamiViewBody({super.key});

  @override
  State<WhoamiViewBody> createState() => _WhoamiViewBodyState();
}

class _WhoamiViewBodyState extends State<WhoamiViewBody> {
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  var index = 0;
  bool answerVisible = false;
  String playerButtonText = 'Show Player';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhoamiCubit, WhoamiState>(
      builder: (context, state) {
        if (state is WhoamiSuccess) {
          List<String> cluesList = [
            state.whoamiModel.clue1,
            state.whoamiModel.clue2,
            state.whoamiModel.clue3,
            state.whoamiModel.clue4,
            state.whoamiModel.clue5,
          ];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: AnimatedList(
                    key: key,
                    initialItemCount: 1,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(begin: const Offset(1, 0), end: Offset.zero),
                        ),
                        child: ClueItem(
                          clue: cluesList[index],
                          index: index + 1,
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainInteractivity: true,
                  maintainSemantics: true,
                  maintainSize: true,
                  visible: answerVisible,
                  child: AnimatedContainer(
                    height: answerVisible ? 50 : 0,
                    width:
                        answerVisible ? MediaQuery.of(context).size.width : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: Center(
                      child: Text(
                        state.whoamiModel.answer,
                        style: Styles.bold19,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        if (index < cluesList.length - 1) {
                          index++;
                          key.currentState!.insertItem(index);
                        }
                      },
                      text: 'Next Clue',
                    ),

                    CustomElevatedButton(
                      text: playerButtonText,
                      onPressed: () {
                        answerVisible = !answerVisible;
                        if (playerButtonText == 'Show Player') {
                          playerButtonText = 'Hide Player';
                        } else {
                          playerButtonText = 'Show Player';
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'Next Player',
                  onPressed: () {
                    context.read<WhoamiCubit>().getWhoamiChallenge();
                  },
                ),
                SizedBox(height: 100.h),
              ],
            ),
          );
        } else if (state is WhoamiFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
