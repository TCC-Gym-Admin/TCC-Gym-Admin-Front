import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_state.dart';
import 'package:tcc_gym_admin_front/feature/home/services/interfaces/i_home_services.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeServices services;
  HomeCubit(this.services) : super(const HomeState());

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  Future<void> getEmployees() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await services.getEmployees();

    result.fold(
      (success) {
        emit(state.copyWith(employee: success, status: HomeStatus.success));
      },
      (failure) {
        emit(state.copyWith(employee: [], status: HomeStatus.failure));
      },
    );
  }
}
