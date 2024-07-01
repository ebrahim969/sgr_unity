import 'package:hive/hive.dart';
import 'package:sgr_unity/features/auth/data/models/user_model.dart';

abstract interface class UserInfoLocalDataSource {
  void uploadLocalUserInfo({required UserModel user});
  UserModel loadUserInfo();
}

class UserInfoLocalDataSourceImpl implements UserInfoLocalDataSource {
  final Box box;

  UserInfoLocalDataSourceImpl(this.box);
  @override
  UserModel loadUserInfo() {
    late UserModel user;
    box.read(() {
      user = UserModel.fromJson(box.get('currentUserInfo'));
    });
    return user;
  }

  @override
  void uploadLocalUserInfo({required UserModel user}) {
    box.clear();
    box.write(() {
      box.put('currentUserInfo', user.toJson());
    });
  }
}
