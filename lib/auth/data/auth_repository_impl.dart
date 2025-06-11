import 'package:balcuisine/auth/domain/entities/user_entity.dart';
import 'package:balcuisine/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
 

class AuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    final userCred = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCred.user!;
    return UserEntity(uid: user.uid, email: user.email ?? '');
  }
}
