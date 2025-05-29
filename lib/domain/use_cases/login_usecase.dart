import 'package:calculator_lock/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  Future login({String? userName, String? password}) async {
    return _loginRepository.login(userName: userName, password: password);
  }
}
