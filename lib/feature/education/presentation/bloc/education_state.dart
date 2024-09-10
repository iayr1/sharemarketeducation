import 'package:meta/meta.dart';

@immutable
abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final Map<String, dynamic> data;

  EducationLoaded(this.data);
}

class EducationError extends EducationState {
  final String message;

  EducationError(this.message);
}
