import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/layout/science/presentation/cubit/science_cubit.dart';
import 'package:news/presentation/widget/articlle_widget.dart';

import '../../../../../presentation/screens/details_screen.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({super.key});

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceCubit, ScienceState>(builder: (context, state) {
      if (state is ScienceStateIsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ScienceStateLoaded) {
        return Padding(
          padding:const  EdgeInsets.all(8),
          child: ListView.separated(
             shrinkWrap: true,
                scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetialsScreen(image: state.getNewsData.articles![index].urlToImage.toString(), title: state.getNewsData.articles![index].title.toString(),content: state.getNewsData.articles![index].content.toString(),publishAt: state.getNewsData.articles![index].publishedAt.toString(),)));
                  },
                  child: Articlewidget(
                      imageUrl: state.getNewsData.articles![index].urlToImage
                          .toString(),
                      title: state.getNewsData.articles![index].title.toString(),
                      publishedAt: state.getNewsData.articles![index].publishedAt
                          .toString()),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.getNewsData.articles!.length),
        );
      }
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      );
    });
  }
}
