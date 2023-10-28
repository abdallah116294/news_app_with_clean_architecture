import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/layout/business/presentation/cubit/business_cubit.dart';
import 'package:news/presentation/widget/articlle_widget.dart';

import '../../../../../presentation/screens/details_screen.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessState>(builder: (context, state) {
      if (state is BusinessStateIsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BusinessStateLoaded) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
               shrinkWrap: true,
                scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetialsScreen(image: state.getBusinessData.articles![index].urlToImage.toString(), title: state.getBusinessData.articles![index].title.toString(),content: state.getBusinessData.articles![index].content.toString(),publishAt: state.getBusinessData.articles![index].publishedAt.toString(),)));
                },
                child: Articlewidget(
                    imageUrl: state.getBusinessData.articles![index].urlToImage
                        .toString(),
                    title:
                        state.getBusinessData.articles![index].title.toString(),
                    publishedAt: state
                        .getBusinessData.articles![index].publishedAt
                        .toString()),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.getBusinessData.articles!.length),
        );
      } else if (state is BusinessStateError) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.red),
        );
      }
      return const  Center(
          child: CircularProgressIndicator(color: Colors.purple),
        );
    });
  }
}
