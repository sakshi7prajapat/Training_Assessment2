part of 'modals_bloc.dart';

 class ModalsState extends Equatable {
  const ModalsState();
  
  @override
  List<Object> get props => [];
}

final class ModalsInitial extends ModalsState {
@override
  List<Object> get props => [];
}

final class ModalsLodingState extends ModalsState {
  @override
  List<Object> get props => [];
}

final class ModalsSuccessState extends ModalsState {
    final datamodals;

  ModalsSuccessState(this.datamodals);
  @override
  List<Object> get props => [datamodals];
}

final class ModalsErrorState extends ModalsState {
  final String errorMessage;

  ModalsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

