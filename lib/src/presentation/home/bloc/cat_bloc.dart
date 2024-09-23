// ignore_for_file: unnecessary_null_comparison

import 'package:challenge_pragma_msolimano/src/domain/models/cat.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/list_cats.dart';
import 'package:challenge_pragma_msolimano/src/domain/use_cases/cat/cat_use_case.dart';
import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_event.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_state.dart';
import 'package:challenge_pragma_msolimano/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatsUseCase _catsUseCase;
  late List<Cat> catList = [];

  CatBloc(this._catsUseCase) : super(const CatState()) {
    on<InitTEvent>(_onInitEvent);
    on<FilterChanged>(_onFilterChanged);
    on<PageChanged>(_onPageChanged);
    on<CleanFiter>(_onCleanFilter);
  }

  Future<void> _onInitEvent(InitTEvent event, Emitter<CatState> emit) async {
    emit(
      state.copyWith(response: Loading()),
    );
    int page = int.tryParse(state.page.value) ?? 0;
    if (state.filter.value.isNotEmpty) catList.clear();

    Resource catsResponse =
        await _catsUseCase.getCats.run(state.filter.value, page);
    if (catsResponse is Success) {
      ListCats listCats = catsResponse.data as ListCats;
      catList.addAll(listCats.cats);
    }
    emit(state.copyWith(response: catsResponse));
  }

  Future<void> _onFilterChanged(
      FilterChanged event, Emitter<CatState> emit) async {
    emit(state.copyWith(
        filter: BlocFormItem(
      value: event.filter.value,
    )));
  }

  Future<void> _onPageChanged(PageChanged event, Emitter<CatState> emit) async {
    emit(state.copyWith(
        page: BlocFormItem(
      value: event.page.value,
    )));
  }

  Future<void> _onCleanFilter(CleanFiter event, Emitter<CatState> emit) async {
    emit(
      state.copyWith(response: Loading()),
    );
    catList.clear();
    Resource catsResponse = await _catsUseCase.getCats.run('', 0);
    if (catsResponse is Success) {
      ListCats listCats = catsResponse.data as ListCats;
      catList.addAll(listCats.cats);
    }
    emit(state.copyWith(response: catsResponse));
  }
}
