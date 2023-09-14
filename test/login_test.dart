import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_assesment_2/bloc/login_bloc.dart';
import 'package:training_assesment_2/model/home_page.dart';
import 'package:training_assesment_2/model/login_page.dart';

void main() {
  testWidgets('test the text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));
    expect(find.text('Welcome !'), findsOneWidget);
    //Finder image(ImageProvider image, { bool skipOffstage = true }) => _WidgetImageFinder(image, skipOffstage: skipOffstage);
  });

  testWidgets('test the text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));
    expect(find.image(AssetImage("asset/family.png")), findsOneWidget);
    expect(find.byIcon(Icons.place), findsOneWidget);
    expect(find.byIcon(Icons.ac_unit_sharp), findsNothing);
    expect(find.byIcon(Icons.group), findsOneWidget);
    expect(find.byIcon(Icons.macro_off), findsNothing);
    expect(find.byType(Drawer), findsNothing);

    // await tester.tap(find.byIcon(Icons.menu));
    // await tester.pumpAndSettle();
    // expect(find.byType(Drawer), findsOneWidget);
  });
}
