import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithEmail(String email, String password);
  UserEntity? get currentUser;   

}
