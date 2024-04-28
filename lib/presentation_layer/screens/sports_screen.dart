import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/news_cubit.dart';
import 'package:news_app/presentation_layer/widgets/articleItem.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: list.length>0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>ArticleItem(article: list[index],),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            itemCount: list.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),);
      },
    );
  }
}
