import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0.0,
            title: const Text('Login with JSON Files'),
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
        body: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void _login() {
    _saveLoginData();
    print(
        'flutter: username:${_usernameController.text}, password:${_passwordController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Username: ${_usernameController.text}, Password: ${_passwordController.text}'),
      ),
    );
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print("flutter: Directoyr is $path/login_data.json");
    return File('$path/login_data.json');
  }

  Future<void> _readLoginData() async {
    try {
      final file = await _localFile;
      final loginData = await file.readAsString();
      print('flutter: LoginData $loginData');
      final data = jsonDecode(loginData);
      _usernameController.text = data['username'];
      _passwordController.text = data['password'];
    } catch (e) {
      print("Failed to load login data: $e");
    }
  }

  Future<void> _saveLoginData() async {
    final file = await _localFile;
    final data = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };
    await file.writeAsString(jsonEncode(data));
  }
  @override
  void initState() {
    super.initState();
    _readLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
