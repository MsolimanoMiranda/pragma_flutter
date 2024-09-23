import 'package:challenge_pragma_msolimano/injection.dart';
import 'package:challenge_pragma_msolimano/src/domain/use_cases/cat/cat_use_case.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_bloc.dart';
import 'package:challenge_pragma_msolimano/src/presentation/home/bloc/cat_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<CatBloc>(
      create: (context) => CatBloc(locator<CatsUseCase>())..add(InitTEvent())),
];
