import 'package:hive/hive.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';

abstract class AuthLocalDataSource {
  Future<void> setToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  var authBox = Hive.box(AppConstants.kAuth);

  @override
  Future<void> deleteToken() async {
    authBox.delete(AppConstants.kToken);
  }

  @override
  Future<String?> getToken() async {
    return await authBox.get(AppConstants.kToken);
  }

  @override
  Future<void> setToken(String token) async {
    await authBox.put(AppConstants.kToken, token);
  }
}
