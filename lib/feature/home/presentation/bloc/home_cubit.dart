import 'package:bloc/bloc.dart';
import 'package:edtech_app/feature/home/domain/home_repository.dart';
import 'package:edtech_app/feature/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchData() async {
    try {
      emit(HomeLoading());
      final data = await repository.getHomeData();
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
