import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novolatask/layouts/home/cubit/states.dart';
import 'package:novolatask/models/home_model.dart';

import '../../../network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() :super( HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  int currentIndex =0 ;


  void getHomeDataFromApi(){
    emit(HomeLoadingState());
    DioHelper.getData(
        url: "",
        query: {}).then((value){
         print("valuuue${value}");
         homeModel=HomeModel.fromJson(value.data);
         emit(HomeSuccessState());


    }).then((value){
      emit(HomeErrorStateState(value.toString()));
    }).catchError((error){
      emit(HomeErrorStateState(error.toString()));

    });}


   changeDotsIndex(int index){
    currentIndex= index;
    return currentIndex;
  }

}