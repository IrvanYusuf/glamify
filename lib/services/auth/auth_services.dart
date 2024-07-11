import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glamify/providers/auth_provider_hive.dart';

class AuthServices {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
  }

  // instasiasi collection user
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

// create new user
  Future<String> createUserWithEmailAndPassword(
      email, password, setState, uid, newUserData) async {
    String res = "Gagal daftar";

    String hashPassword(String password) {
      return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    try {
      setIsLoading = true;
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (credential.additionalUserInfo!.isNewUser) {
        setState(() {
          uid = credential.user!.uid;
        });

        String hashedPassword = hashPassword(password.text);
        newUserData['password'] = hashedPassword;
        newUserData['uid'] = uid;

        final addData = await userRef.add(newUserData);
        res = "Success";

        return res;
      }
      return res;
    } on FirebaseAuthException catch (e) {
      setIsLoading = false;
      if (e.code == 'weak-password') {
        return 'Password anda terlalu lemah.';
      } else if (e.code == 'email-already-in-use') {
        return 'Email sudah digunakan.';
      } else if (e.code == 'invalid-email') {
        return 'Format email tidak valid.';
      }
      return res;
    } finally {
      setIsLoading = false;
    }
  }

  // login user
  Future<String> signInWithEmailAndPassword(email, password, context) async {
    String res = "Gagal login";
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      QuerySnapshot querySnapshot =
          await userRef.where('uid', isEqualTo: credential.user!.uid).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        final Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;
        final Map<String, dynamic> authData = {
          "email": credential.user!.email,
          "username": userData!['username'],
          "photoUrl": userData['photo_url'],
          "uid": credential.user!.uid,
        };

        AuthProviderHive authProviderHive = AuthProviderHive();
        authProviderHive.savedCredential(authData);
        res = "Success";
      }
      // {uid: 7jwC4Axn5kRRgVSygKmMzmjp7X82, konfirmasi_password: irvan123, password: $2a$10$TLHqDGYQQEii0snfRTNqwujcTgLThkWwbLToby9nkjcZf7OtJ4JRS, email: irvanyusufcahyadi@gmail.com, username: Irvan Yusuf Cahyadi }
      return res;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-credential') {
        return 'Akun tidak terdaftar';
      }
      return res;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
