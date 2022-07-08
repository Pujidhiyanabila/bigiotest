import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_nomor18/components/bottom_navigation.dart';
import 'package:soal_nomor18/providers/people_view_model.dart';
import 'package:soal_nomor18/services/remote_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PeopleViewModel(remoteServices : RemoteServices()),
          ),
          // ChangeNotifierProvider(
          //   create: (_) => BestSellerViewModel(),
          // ),
          // ChangeNotifierProvider(
          //   create: (_) => DetailViewModel(),
          // ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BottomNavigation(),
        ),
    );
  }
}

