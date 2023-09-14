import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_assesment_2/model/document_page.dart';

import '../bloc/modals_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    // TODO: implement build
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Color.fromARGB(255, 19, 138, 235),
              size: 30,
            )),
      ),
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FractionallySizedBox(
              child: Image.asset("asset/family.png"),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: (itemWidth / 150),
                // primary: false,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(30),
                crossAxisCount: 2,

                children: [
                  Container(
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      
                      ),
                   // 
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder_copy,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "My Portal",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                     decoration:  BoxDecoration(
                      color: Colors.white,
                     ),
                    
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.place,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "Contact/route",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                     decoration:  BoxDecoration(
                      color: Colors.white,
                     ),
                    
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "Teams",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),

                  Container(
                     decoration:  BoxDecoration(
                      color: Colors.white,
                     ),
                    
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.document_scanner_outlined,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "Documentation",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                     decoration:  BoxDecoration(
                      color: Colors.white,
             
                     ),
                    
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.network_ping,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "Social Media",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                     decoration:  BoxDecoration(
                      color: Colors.white,
                     ),
                    
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          color: Color.fromARGB(255, 19, 138, 235),
                          size: 35,
                        ),
                        Text(
                          "QR Scanner",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.blue,
                  // ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 100,
            //       height: 50,
            //       color: Colors.blue,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      drawer: Drawer(
          // key: _key,
          child: ListView(
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: ClipOval(
                            child: Image.asset(
                              "asset/family.png",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Hello, John",
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                "john@gmail.com",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListTile(
              title: const Text('Home',
              style: TextStyle(
                fontSize: 20
              ),),
              leading: Icon(Icons.home_outlined,
              size: 35,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: ListTile(
              title: const Text('Documents',
              style: TextStyle(
                fontSize: 20
              ),),
              leading: Icon(Icons.person_2_outlined,
              size: 35,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => ModalsBloc(),
                          child: DocumentPage(),
                        )));
              },
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: ListTile(
              title: const Text('Share',
               style: TextStyle(
                fontSize: 20
              ),),
              leading: Icon(Icons.share_outlined,
              size: 35,),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
          ),
          Divider(),
          SizedBox(
            height: 40,
            child: ListTile(
              title: const Text('Disclaimer & Privacy',
               style: TextStyle(
                fontSize: 20
              )),
              leading: Icon(Icons.info_outline,
              size: 35,),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
          ),
        ],
      )),
    );
  }
}
