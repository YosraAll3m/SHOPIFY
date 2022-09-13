

import '../../../../response/login_response.dart';

abstract class StatesLogin {}
class StateInitialLogin extends StatesLogin {}
class StateLoadingLogin extends StatesLogin {}

class StateSuccessLogin extends StatesLogin {
  final LoginResponse loginModel;

  StateSuccessLogin(this.loginModel);
}

class StateErrorLogin extends StatesLogin {
  final String error ;

  StateErrorLogin(this.error);

}
class StatePasswordVisibilityLogin extends StatesLogin {}
