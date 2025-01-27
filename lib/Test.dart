import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleLoginScreen(),
    );
  }
}

class GoogleLoginScreen extends StatefulWidget {
  @override
  _GoogleLoginScreenState createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  GoogleSignInAccount? _currentUser;

  // Google 로그인 처리
  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      setState(() {
        _currentUser = user;
      });
    } catch (error) {
      print("Google 로그인 실패: $error");
    }
  }

  // Google 로그아웃 처리
  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
    setState(() {
      _currentUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google 로그인 테스트"),
      ),
      body: Center(
        child: _currentUser == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("로그인하지 않았습니다."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignIn,
              child: Text("Google 로그인"),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("환영합니다, ${_currentUser!.displayName}!"),
            SizedBox(height: 10),
            Text("이메일: ${_currentUser!.email}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignOut,
              child: Text("로그아웃"),
            ),
          ],
        ),
      ),
    );
  }
}
