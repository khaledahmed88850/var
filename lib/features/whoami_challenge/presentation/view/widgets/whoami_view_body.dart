import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/whoami_challenge/presentation/cubit/whoami_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        child: MyWidget(
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
                  child: Text(
                    'Player Name: ${state.whoamiModel.answer}',
                    style: Styles.bold16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        if (index < cluesList.length - 1) {
                          index++;
                          key.currentState!.insertItem(index);
                        }
                      },
                      child: Text(
                        'Next Clue',
                        style: Styles.bold16.copyWith(color: Colors.white),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        answerVisible = !answerVisible;
                        if (playerButtonText == 'Show Player') {
                          playerButtonText = 'Hide Player';
                        } else {
                          playerButtonText = 'Show Player';
                        }
                        setState(() {});
                      },
                      child: Text(
                        playerButtonText,
                        style: Styles.bold16.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.index, required this.clue});
  final int index;
  final String clue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$index Clue', style: Styles.medium15),
        Text(clue, style: Styles.bold16),
        const Divider(thickness: 2),
      ],
    );
  }
}
