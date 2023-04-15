import 'dart:convert';

import 'package:demo/local_storage.dart';
import 'package:demo/network_service.dart';
import 'package:demo/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'demo_state.dart';

class DemoCubit extends Cubit<DemoState> {
  DemoCubit() : super(DemoState());

  NetworkService service = NetworkService();

   initialState() async {
    String? name = await LocalStorage.getName();
    String? pwd = await LocalStorage.getPwd();
    emit(state.copyWith(
        name: name, pwd: pwd));
  }

  void name(String? value) {
    emit(state.copyWith(name: value));
  }

  void email(String? value) {
    emit(state.copyWith(email: value));
  }

  void pwd(String? value) {
    emit(state.copyWith(pwd: value));
  }

  void contact(String? value) {
    emit(state.copyWith(contact: value));
  }

  void profession(String? value) {
    emit(state.copyWith(profession: value));
  }

  void isObsecure() {
    bool value = !state.isObsecure!;
    emit(state.copyWith(isObsecure: value));
  }

  void saveCreds() async {
    await LocalStorage.saveName(state.name!);
    await LocalStorage.savePwd(state.pwd!);
  }

  Future<bool> request() async {
    emit(state.copyWith(isLoading: true));
    final object = jsonEncode({
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting",
    });

    var response = await NetworkService().postRequest(object);
    print(response);
    ResponseModel getResponse =
        ResponseModel.fromJson(jsonDecode(response ?? "nahi aya"));
    print(getResponse);
    emit(state.copyWith(
        responseData: getResponse, isLoading: false, isAuth: true));

    return true;
  }
}
