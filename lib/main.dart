import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/business_logic_layer/news_cubit.dart';
import 'package:news_app/data_layer/web_services/news_web_services.dart';
import 'package:news_app/presentation_layer/screens/home_layout_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            // ThemeData(
            //   scaffoldBackgroundColor: HexColor('333739'),
            //   primarySwatch: Colors.deepOrange,
            //   appBarTheme: AppBarTheme(
            //       backgroundColor: HexColor('333739'),
            //       systemOverlayStyle: SystemUiOverlayStyle(
            //         statusBarColor: HexColor('333739'),
            //         statusBarIconBrightness: Brightness.light,
            //       ),
            //       titleTextStyle: TextStyle(
            //         color: Colors.white,
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       iconTheme: IconThemeData(
            //           color: Colors.white
            //       )
            //   ),
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //       type: BottomNavigationBarType.fixed,
            //       selectedItemColor: Colors.deepOrange,
            //       unselectedItemColor: Colors.grey,
            //       elevation: 50.0,
            //       backgroundColor: HexColor('333739')
            //   ),
            //   textTheme: TextTheme(
            //       bodyText1: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white
            //       )
            //   ),
            //
            // ),
            // themeMode: ThemeMode.dark,
            theme: ThemeData.light(),
            // ThemeData(
            //   primarySwatch: Colors.deepOrange,
            //   appBarTheme: AppBarTheme(
            //       systemOverlayStyle: SystemUiOverlayStyle(
            //         statusBarColor: Colors.white,
            //         statusBarIconBrightness: Brightness.dark,
            //       ),
            //       titleTextStyle: TextStyle(
            //         color: Colors.black,
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       )
            //   ),
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //       type: BottomNavigationBarType.fixed,
            //       selectedItemColor: Colors.deepOrange,
            //       elevation: 50.0
            //   ),
            //   textTheme: TextTheme(
            //       bodyText1: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black
            //       )
            //   ),
            //
            // ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}



