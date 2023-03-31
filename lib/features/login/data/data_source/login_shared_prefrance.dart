import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPrefrance {
  storeLoginToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('LoginToken', token);
  }

  getLoginToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('====SharedPrefData====');
    print(pref.getString('LoginToken')!);

    return pref.getString('LoginToken')!;
  }
}
