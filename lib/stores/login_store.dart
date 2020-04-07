import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";

  @action
  setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @observable
  bool passwordObscure = true;
  @action
  setPasswordObscure() => passwordObscure = !passwordObscure;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid =>
      RegExp(r"^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$")
          .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  Function get handleLogin => (isFormValid && !loading) ? login : null;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    loading = false;
    loggedIn = true;

    email = "";
    password = "";
  }

  @action
  void logout() {
    loggedIn = false;
  }
}
