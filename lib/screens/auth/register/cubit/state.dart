
import '../../../../response/login_response.dart';

abstract class SignUpViewStates{}
class StateInitialRegister extends SignUpViewStates {}
class StateLoadingRegister extends SignUpViewStates {}

class StateSuccessRegister extends SignUpViewStates {
  final LoginResponse loginModel;

  StateSuccessRegister(this.loginModel);
}

class StateErrorRegister extends SignUpViewStates {
  final String error ;

  StateErrorRegister(this.error);

}
class StatePasswordVisibilityRegister extends SignUpViewStates {}
