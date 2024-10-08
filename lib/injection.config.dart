// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:challenge_pragma_msolimano/src/data/data_source/remote/services/cat_services.dart'
    as _i472;
import 'package:challenge_pragma_msolimano/src/di/app_module.dart' as _i436;
import 'package:challenge_pragma_msolimano/src/domain/repository/cat_repository.dart'
    as _i875;
import 'package:challenge_pragma_msolimano/src/domain/use_cases/cat/cat_use_case.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final appModule = _$AppModule();
    gh.factory<_i472.CatServices>(() => appModule.catServices);
    gh.factory<_i875.CatRepository>(() => appModule.catRepository);
    gh.factory<_i13.CatsUseCase>(() => appModule.catUseCase);
    return this;
  }
}

class _$AppModule extends _i436.AppModule {}
