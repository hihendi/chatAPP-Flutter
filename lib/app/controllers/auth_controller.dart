import 'package:chatapp/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userAccount;
  UserCredential? _userCredential;

  // Function pertama kali untuk mengecek apakah aplikasi baru pertama di install dan sudah pernah login atau belum
  Future<void> firstInitialized() async {
    //Ini untuk mengecek apakah user sudah pernah login, jika sudah maka akan langsung menuju ke home
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    //Ini untuk mengecek apakah aplikasi sudah pernah diinstall dan apakah user sudah pernah login, jika sudah login maka akan skip introduction screen

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  //Ini function untuk mengubah isAuth = true
  Future<bool> autoLogin() async {
    try {
      final isSignedIn = await _googleSignIn.isSignedIn();
      if (isSignedIn) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  //Ini function untuk mengubah isSkipIntro = true
  Future<bool> skipIntro() async {
    GetStorage box = GetStorage();

    if (box.read("skipIntro") != null || box.read("skipIntro") == true) {
      return true;
    }
    return false;
  }

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

        //Ini untuk menyimpan ke local memory hp bahwa status user pernah login dan tidak menampilkan introduction screen lagi
        GetStorage box = GetStorage();
        if (box.read("skipIntro") != null) {
          box.remove("skipIntro");
        }
        box.write("skipIntro", true);

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
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    print("Berhasil LogOut");
    Get.offAllNamed(Routes.LOGIN);
  }
}
