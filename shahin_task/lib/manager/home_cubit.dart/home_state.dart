import 'package:shahin_task/manager/home_cubit.dart/home_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeModel> products;
  HomeLoaded(this.products);
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}
