import 'dart:async';

Future<String> fetchUserData() {
  return Future.delayed(const Duration(seconds: 3), () {
    int userId = 6430402090;
    int lastDigit = userId % 10;
    if (lastDigit.isEven) {
      return "The last digit of my ID ($lastDigit) is an even number";
    } else {
      throw "The last digit of my ID ($lastDigit) is an odd number";
    }
  });
}

void main() {
  fetchUserData()
    .then((value) => print('Complete with value: $value'))
    .catchError((error) => print('Complete with error: $error'));
}
