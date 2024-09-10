import 'package:bloc/bloc.dart';
import 'package:edtech_app/feature/education/domain/education_repository.dart';
import 'package:edtech_app/feature/education/presentation/bloc/education_state.dart';


class EducationCubit extends Cubit<EducationState> {
  final EducationRepository repository;

  EducationCubit(this.repository) : super(EducationInitial());

  Future<void> fetchData() async {
    try {
      emit(EducationLoading());
      final data = await repository.getEducationData();
      emit(EducationLoaded(data));
    } catch (e) {
      emit(EducationError(e.toString()));
    }
  }
}
