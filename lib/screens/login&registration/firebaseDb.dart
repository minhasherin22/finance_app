import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper{
  final FirebaseAuth auth = FirebaseAuth.instance;

 Future<String?> Login({required String email, required String password})async {
   try {
     await auth.signInWithEmailAndPassword(
      email: email,
      password: password);
     return null;
} on FirebaseAuthException catch (e) {
  return e.message;
}
 }

  Future<String?> register({required String email, required String password}) async{
     try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}