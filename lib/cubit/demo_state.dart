part of 'demo_cubit.dart';

class DemoState {
  final String? email;
  final String? pwd;
  final String? name;
  final String? contact;
  final String? profession;
  final bool? isObsecure;
  final ResponseModel? responseData;
  final bool isLoading;
  final bool? isAuth;

  DemoState({
    this.email,
    this.pwd,
    this.name,
    this.contact,
    this.profession = "Please enter",
    this.isObsecure = true,
    this.responseData,
    this.isLoading = false,
    this.isAuth,
  });

  DemoState copyWith({
    String? email,
    String? pwd,
    String? name,
    String? contact,
    String? profession,
    bool? isObsecure,
    ResponseModel? responseData,
    bool? isLoading,
    bool? isAuth,
  }) {
    return DemoState(
      email: email ?? this.email,
      pwd: pwd ?? this.pwd,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      profession: profession ?? this.profession,
      isObsecure: isObsecure ?? this.isObsecure,
      responseData: responseData ?? this.responseData,
      isLoading: isLoading ?? this.isLoading,
      isAuth: isAuth ?? this.isAuth,
    );
  }
}
