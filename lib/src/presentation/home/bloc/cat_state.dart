// ignore_for_file: unnecessary_this

import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';
import 'package:challenge_pragma_msolimano/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CatState extends Equatable {
  final BlocFormItem filter;
  final BlocFormItem page;
  final Resource? response;

  const CatState({
    this.filter = const BlocFormItem(value: '', error: 'Ingresa el filtro'),
    this.response,
    this.page = const BlocFormItem(value: '0'),
  });

  CatState copyWith(
      {BlocFormItem? filter,
      BlocFormItem? page,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return CatState(
        filter: filter ?? this.filter,
        page: page ?? this.page,
        response: response);
  }

  @override
  List<Object?> get props => [filter, response, page];
}
