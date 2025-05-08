part of 'bank_question_increment_cubit.dart';

@immutable
sealed class BankQuestionIncrementState {}

final class BankQuestionIncrementInitial extends BankQuestionIncrementState {}

final class QuestionIncrement extends BankQuestionIncrementState {}

final class SaveScore extends BankQuestionIncrementState {}

final class Reset extends BankQuestionIncrementState {}
