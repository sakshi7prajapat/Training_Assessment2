


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_assesment_2/bloc/modals_bloc.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPage();
}

class _DocumentPage extends State<DocumentPage> {
  ModalsBloc _bloc = ModalsBloc();
  ModalsState _state = ModalsState();
  @override
  void initState() {
   _bloc.add(ModalsSuccessEvent());
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Document",
          style: TextStyle(color: Colors.black),
        ),
        
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
        
        color: Colors.black, onPressed: () { 
          Navigator.pop(context);
         },),
        
      ),
     
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<ModalsBloc, ModalsState>(
        bloc: _bloc,
        builder: (context, state) {
         if(state is ModalsLodingState){
            return Center(
              child: CircularProgressIndicator(),
             
            );
         }
         else if(state is ModalsErrorState){
          return Center(
              child: Text(state.errorMessage),
          );
         }
         else if(state is ModalsSuccessState){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.datamodals.data.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(state.datamodals.data[index].avatar),
                        title: Text(state.datamodals.data[index].email,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          
                        ),),
                        subtitle: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(state.datamodals.data[index].firstName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500
                              ),),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(state.datamodals.data[index].lastName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),

                      ),
                    ),
                  );
                 
                },
            
              ),
            );
         }
         return SizedBox();
        },
      
      ),
    );
  }

  
}
