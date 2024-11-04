import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomeInitail()) {
    on<HomePageThemeToggleEvent>(homePageThemeToggleEvent);
  }

  FutureOr<void> homePageThemeToggleEvent(
      HomePageThemeToggleEvent event, Emitter<HomePageState> emit) {
    emit(HomePageThemeToggleActionState());
  }
}
