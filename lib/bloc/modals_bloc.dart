import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:training_assesment_2/modals/modals.dart';

part 'modals_event.dart';
part 'modals_state.dart';

class ModalsBloc extends Bloc<ModalsEvent, ModalsState> {
  ModalsBloc() : super(ModalsInitial()) {
    on<ModalsEvent>((event, emit) async{
      try{
          emit(ModalsLodingState());
          var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
          if(response.statusCode==200){
            print(response.body);
            emit(ModalsSuccessState(dataModelFromJson(response.body)));
          }
      }catch(e){
        emit(ModalsErrorState(e.toString()));
      }
    });
  }
}
