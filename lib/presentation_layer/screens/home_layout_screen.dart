import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/news_cubit.dart';
import 'package:news_app/data_layer/web_services/news_web_services.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){},icon:Icon(Icons.search, size: 30,) ),
                IconButton(onPressed: (){
                 cubit.changeAppMode();
                },icon:Icon(Icons.brightness_4_rounded, size: 30,) ),
              ],
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
                items: cubit.bottomItems,
              onTap: (index){
                cubit.changeBottomNav(index);
              },
            ),
          );
        },
      ),
    );
  }
}
