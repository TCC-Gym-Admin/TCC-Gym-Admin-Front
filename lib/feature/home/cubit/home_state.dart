import 'package:equatable/equatable.dart';
import 'package:tcc_gym_admin_front/feature/employees/models/employees_model.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final int selectedIndex;
  final List<EmployeesModel> employee;
  final HomeStatus status;

  const HomeState({
    this.status = HomeStatus.initial,
    this.employee = const [],
    this.selectedIndex = 0,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<EmployeesModel>? employee,
    int? selectedIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      employee: employee ?? this.employee,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, employee, status];
}
