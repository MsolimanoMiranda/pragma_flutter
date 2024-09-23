import 'package:challenge_pragma_msolimano/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();
  @override
  List<Object?> get props => [];
}

class InitTEvent extends CatEvent {
  const InitTEvent();
}

class CleanFiter extends CatEvent {
  const CleanFiter();
}

class FilterChanged extends CatEvent {
  final BlocFormItem filter;
  const FilterChanged({required this.filter});
  @override
  List<Object?> get props => [filter];
}

class PageChanged extends CatEvent {
  final BlocFormItem page;
  const PageChanged({required this.page});
  @override
  List<Object?> get props => [page];
}
