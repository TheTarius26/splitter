import 'package:split_bills/domain/entities/user/user.dart';

interface class UserRepository {
  Future<User> getUser() => throw UnimplementedError();
  Future<void> saveUser(User user) => throw UnimplementedError();
  Future<void> deleteUser(User user) => throw UnimplementedError();
}
