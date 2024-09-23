import 'package:challenge_pragma_msolimano/src/data/data_source/remote/services/cat_services.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/list_cats.dart';
import 'package:challenge_pragma_msolimano/src/domain/repository/cat_repository.dart';
import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';

class CatRepositoryImpl implements CatRepository {
  CatServices catServices;
  CatRepositoryImpl(this.catServices);

  @override
  Future<Resource<ListCats>> getCats(String filter, int page) {
    return catServices.find(filter, page);
  }
}
