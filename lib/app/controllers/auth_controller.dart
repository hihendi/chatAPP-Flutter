import 'package:chatapp/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userAccount;
  UserCredential? _userCredential;

  Future<void> login() async {
    try {
      //Ini untuk mencegah kebocoran google account
      await _googleSignIn.signOut();

      //Ini untuk mendapatkan google account
      await _googleSignIn.signIn().then((value) => _userAccount = value);
      //Ini untuk mengecek apakah user sudah login atau belum, gagal login atau tidak
      final isSignedIn = await _googleSignIn.isSignedIn();

      if (isSignedIn) {
        //kondisi berhasil Login, akan didaftarkan ke firebase authentication

        //Ini untuk mendapatkan token ID dan access token
        final googleAuth = await _userAccount!.authentication;
        //Ini untuk mendaftarkan token ID dan access token ke credential google auth
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        //Ini untuk mengirimkan credential ke firebase authentication
        final credentialUser = await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => _userCredential = value);

        print("BERHASIL LOGIN");
        print(credentialUser);

        print(_userAccount);
        Get.offAllNamed(Routes.HOME);
      } else {
        //Ini kondisi gagal LOGIN
        print("LOGIN GAGAL");
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await _googleSignIn.signOut();
    print("Berhasil LogOut");
    Get.offAllNamed(Routes.LOGIN);
  }
}
