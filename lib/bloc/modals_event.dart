part of 'modals_bloc.dart';

sealed class ModalsEvent extends Equatable {
  const ModalsEvent();

  
}

class ModalsSuccessEvent extends ModalsEvent{
  @override
  List<Object> get props => [];
}