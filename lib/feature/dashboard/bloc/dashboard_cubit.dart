import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {
  final int currentIndex;

  DashboardInitial() : currentIndex = 0;
}

class DashboardTabChanged extends DashboardState {
  final int currentIndex;

  DashboardTabChanged(this.currentIndex);
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  void changeTab(int index) {
    emit(DashboardTabChanged(index));
  }
}
