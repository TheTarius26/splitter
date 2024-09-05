// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:split_bills/data/datasource/local_source/user/user_local_source.dart'
    as _i825;
import 'package:split_bills/data/repository/user_repository.dart' as _i975;
import 'package:split_bills/domain/repository/user_repository.dart' as _i325;
import 'package:split_bills/presentation/home/bloc/home_bloc.dart' as _i51;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i51.HomeBloc>(() => _i51.HomeBloc());
    gh.factory<_i825.UserLocalSource>(() => _i825.UserLocalSource(
          name: gh<String>(),
          phone: gh<String>(),
        ));
    gh.singleton<_i325.UserRepository>(
        () => _i975.UserRepositoryImpl(gh<_i825.UserLocalSource>()));
    return this;
  }
}
