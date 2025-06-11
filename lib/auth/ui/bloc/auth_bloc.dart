 import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;

  AuthBloc(this.signInUseCase) : super(AuthInitial()) {
    // Événement de connexion
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final UserEntity user = await signInUseCase(event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure("Échec de la connexion : ${e.toString()}"));
      }
    });

     on<CheckAuthStatus>((event, emit) async {
      try {
        final UserEntity? user = signInUseCase.authRepository.currentUser;
        if (user != null) {
          emit(AuthSuccess(user));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthFailure("Erreur lors de la vérification d'authentification : ${e.toString()}"));
      }
    });
  }
}
