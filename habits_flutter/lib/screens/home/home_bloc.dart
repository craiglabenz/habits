import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

typedef _Emit = Emitter<HomeState>;

/// {@template HomeBloc}
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro HomeBloc}
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, _Emit emit) {},
    );
  }
}

/// Actions that can be taken on the Home page.
@Freezed()
class HomeEvent with _$HomeEvent {
  /// Placeholder event.
  const factory HomeEvent.init() = InitializeHome;
}

/// {@template HomeState}
/// Complete representation of the Home page's state.
/// {@endtemplate
@Freezed()
class HomeState with _$HomeState {
  /// {@macro HomeState}
  const factory HomeState() = _HomeState;
  const HomeState._();

  /// Starter state fed to the [HomeBloc].
  factory HomeState.initial() => const HomeState();
}
