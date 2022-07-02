import 'package:built_value/built_value.dart';

part 'login_page_state.g.dart';

abstract class LoginPageState
    implements Built<LoginPageState, LoginPageStateBuilder> {
  factory LoginPageState([void Function(LoginPageStateBuilder) updates]) =
      _$LoginPageState;

  LoginPageState._();

  bool get loading;

  String? get error;

  bool get openNftListPage;
}
