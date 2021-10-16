import 'package:keleya/_config/_config.dart';
import 'package:keleya/_constants/_local_cache_indexes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '_local_cache_model.dart';

class LocalCacheManager {
  LocalCacheModel _data = LocalCacheModel();
  LocalCacheModel get getData => _data;

  static final LocalCacheManager shared = LocalCacheManager();
  _LocalCacheManager() {}

  Future<void> clearAllData() async {
    var shared = await SharedPreferences.getInstance();
    await shared.clear();
  }

  Future<void> loadData() async {
    var shared = await SharedPreferences.getInstance();
    this._data.isUserLoggedIn =
        shared.getBool(LocalCacheIndexes.user_is_login) ?? false;

    this._data.token = shared.getString(LocalCacheIndexes.user_info_token);
    InAppConfig.fresh_jwt_token = this._data.token ?? '';

    this._data.uid = shared.getString(LocalCacheIndexes.user_info_uid);
    this._data.password =
        shared.getString(LocalCacheIndexes.user_info_password);
    this._data.name = shared.getString(LocalCacheIndexes.user_info_name);
    this._data.email = shared.getString(LocalCacheIndexes.user_info_email);
    this._data.babyBirthDate =
        shared.getString(LocalCacheIndexes.user_info_baby_birth_date);
    this._data.onboardingDone =
        shared.getBool(LocalCacheIndexes.user_info_boarding_done);
  }

  Future<void> setData(LocalCacheModel newModel) async {
    var shared = await SharedPreferences.getInstance();
    await shared.setBool(
        LocalCacheIndexes.user_is_login, newModel.isUserLoggedIn);
    if (newModel.token != null)
      await shared.setString(
          LocalCacheIndexes.user_info_token, newModel.token!);
    if (newModel.password != null)
      await shared.setString(
          LocalCacheIndexes.user_info_password, newModel.password!);
    if (newModel.uid != null)
      await shared.setString(LocalCacheIndexes.user_info_uid, newModel.uid!);
    if (newModel.name != null)
      await shared.setString(LocalCacheIndexes.user_info_name, newModel.name!);
    if (newModel.email != null)
      await shared.setString(
          LocalCacheIndexes.user_info_email, newModel.email!);
    if (newModel.babyBirthDate != null)
      await shared.setString(
          LocalCacheIndexes.user_info_baby_birth_date, newModel.babyBirthDate!);
    if (newModel.onboardingDone != null)
      await shared.setBool(
          LocalCacheIndexes.user_info_boarding_done, newModel.onboardingDone!);

    await this.loadData();
    return null;
  }
}
