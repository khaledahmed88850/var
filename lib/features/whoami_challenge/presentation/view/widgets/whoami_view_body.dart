import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
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
  String playerButtonText = 'اظهار الاجابة';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhoamiCubit, WhoamiState>(
      buildWhen: (previous, current) => previous != current,
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
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    key: key,
                    initialItemCount: 1,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: Offset(index % 2 == 0 ? -1 : 1, 1),
                            end: Offset.zero,
                          ),
                        ),
                        child: ClueItem(
                          clue: cluesList[index],
                          index: index + 1,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainInteractivity: true,
                  maintainSemantics: true,
                  maintainSize: true,
                  visible: answerVisible,
                  child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.darkBlueGrey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    height: answerVisible ? 50.h : 0,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                    child: SingleChildScrollView(
                      child: Text(
                        state.whoamiModel.answer,
                        style: Styles.bold19,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                      text: 'الدليل التالي',
                    ),

                    CustomElevatedButton(
                      text: playerButtonText,
                      onPressed: () {
                        answerVisible = !answerVisible;
                        if (playerButtonText == 'اظهار الاجابة') {
                          playerButtonText = 'اخفاء الاجابة';
                        } else {
                          playerButtonText = 'اظهار الاجابة';
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'اللاعب التالي',
                  onPressed: () {
                    answerVisible = false;
                    playerButtonText = 'اظهار الاجابة';
                    index = 0;
                    context.read<WhoamiCubit>().getWhoamiChallenge();
                  },
                ),
                SizedBox(height: 60.h),
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
