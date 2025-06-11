import 'package:balcuisine/auth/domain/entities/user_entity.dart';
import 'package:balcuisine/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    return UserEntity(uid: user.uid, email: user.email ?? '');
  }

  @override
  UserEntity? get currentUser {   // <-- c'est un getter, pas une méthode
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserEntity(uid: user.uid, email: user.email ?? '');
    }
    return null;
  }
}
