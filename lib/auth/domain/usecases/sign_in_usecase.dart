import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<UserEntity> call(String email, String password) {
    return _authRepository.signInWithEmail(email, password);
  }

  AuthRepository get authRepository => _authRepository;
}
