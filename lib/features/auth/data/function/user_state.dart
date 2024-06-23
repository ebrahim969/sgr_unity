import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/services/service_locator.dart';

void userIsLoggedIn() {
  sl<CacheHelper>().saveData(key: 'UserLoggedIn', value: true);
}

void userIsLoggedOut() {
  sl<CacheHelper>().removeData(key: 'UserLoggedIn');
}
