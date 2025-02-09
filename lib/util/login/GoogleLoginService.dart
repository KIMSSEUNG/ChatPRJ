import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginService {
  // 싱글톤 인스턴스 생성
  static final GoogleLoginService _instance = GoogleLoginService._internal();
  factory GoogleLoginService() => _instance;

  GoogleLoginService._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  GoogleSignInAccount? currentUser;

  // Google 로그인 메서드
  Future<void> signIn() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      currentUser = user;
      print("Google 로그인 성공: ${user?.displayName}");
    } catch (error) {
      print("Google 로그인 실패: $error");
    }
  }

  // Google 로그아웃 메서드
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    currentUser = null;
    print("로그아웃되었습니다.");
  }
}
