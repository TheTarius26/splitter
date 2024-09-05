import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bills/data/datasource/local_source/user/user_local_source.dart';

abstract class AdapterRegistry {
  static void registerAdapters() {
    Hive.registerAdapter(UserAdapter());
  }
}
