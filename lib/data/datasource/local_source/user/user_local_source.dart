import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

part 'user_adapter.g.dart';

@Injectable()
@HiveType(typeId: 0)
class UserLocalSource extends HiveObject {
  UserLocalSource({
    required this.name,
    required this.phone,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phone;
}
