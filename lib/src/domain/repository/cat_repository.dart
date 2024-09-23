import 'package:challenge_pragma_msolimano/src/domain/models/list_cats.dart';
import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';

abstract class CatRepository {
  Future<Resource<ListCats>> getCats(String filter, int page);
}
