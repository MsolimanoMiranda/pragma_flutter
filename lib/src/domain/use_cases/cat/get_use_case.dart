import 'package:challenge_pragma_msolimano/src/domain/repository/cat_repository.dart';

class GetCatsUseCase {
  CatRepository repository;
  GetCatsUseCase(this.repository);
  run(String filter, int page) => repository.getCats(filter, page);
}
