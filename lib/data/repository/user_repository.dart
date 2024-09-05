import 'package:injectable/injectable.dart';
import 'package:split_bills/data/datasource/local_source/user/user_local_source.dart';
import 'package:split_bills/domain/entities/user/user.dart';
import 'package:split_bills/domain/repository/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userLocalSource);
  final UserLocalSource userLocalSource;
  @override
  Future<void> deleteUser(User user) async {}

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
