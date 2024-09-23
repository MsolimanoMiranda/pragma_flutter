import 'package:challenge_pragma_msolimano/src/data/data_source/remote/services/cat_services.dart';
import 'package:challenge_pragma_msolimano/src/data/repository/cat_repository_impl.dart';
import 'package:challenge_pragma_msolimano/src/domain/repository/cat_repository.dart';
import 'package:challenge_pragma_msolimano/src/domain/use_cases/cat/cat_use_case.dart';
import 'package:challenge_pragma_msolimano/src/domain/use_cases/cat/get_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  CatServices get catServices => CatServices();

  @injectable
  CatRepository get catRepository => CatRepositoryImpl(catServices);

  @injectable
  CatsUseCase get catUseCase =>
      CatsUseCase(getCats: GetCatsUseCase(catRepository));
}
