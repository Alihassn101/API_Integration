part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class InitialState extends ApiState {}

class LoadingState extends ApiState {}

class FetchedData extends ApiState {
  Map<String, dynamic>? dataList;
  FetchedData({required this.dataList});
}
