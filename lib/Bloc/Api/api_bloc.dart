import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_project/Repository/ApiRepo.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiRepo apiRepo;
  ApiBloc(this.apiRepo) : super(ApiInitial());

  Stream<ApiState> mapEventToState(
      ApiEvent event,
      ) async* {

    if(event is GetData){
      yield LoadingState();
      Map<String, dynamic>? dataList=await apiRepo.fetchData();
      print(dataList!["data"].length);
      yield FetchedData(dataList: dataList);
    }
  }
}
