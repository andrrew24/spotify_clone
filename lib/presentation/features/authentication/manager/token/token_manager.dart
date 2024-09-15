import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:spotify_clone/common/helper/service_locator.dart';
import 'package:spotify_clone/core/config/constants/app_const.dart';

storeUserToken() async {
  var tokenBox = Hive.box(AppConstants.accessToken);
  String token = serviceLocator<PocketBase>().authStore.token;
  tokenBox.put('token', token);
}

String? getUserToken() {
  return Hive.box(AppConstants.accessToken).get('token');
}

bool isUserSignedIn() {
  return (getUserToken() != null);
}
