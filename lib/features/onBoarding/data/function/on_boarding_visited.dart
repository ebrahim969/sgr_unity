import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/services/service_locator.dart';

void onBoardingVisited() {
  sl<CacheHelper>().saveData(key: "OnBoardingVisited", value: true);
}
