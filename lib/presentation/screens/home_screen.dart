import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/cubit/get_news_data_cubit.dart';
import 'package:news/presentation/screens/details_screen.dart';
import 'package:news/presentation/widget/articlle_widget.dart';
import 'package:news/injection_container.dart' as di;

class HomScreen extends StatefulWidget {
  const HomScreen({super.key});

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {
  _getNewsData() => BlocProvider.of<GetNewsDataCubit>(context).getNewsData();
  @override
  void initState() {
    super.initState();
    _getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    BlocBuilder<GetNewsDataCubit, GetNewsDataState>(
      builder: (context, state) {
        var cubit = GetNewsDataCubit.get(context);
        if (state is GetNewsDataIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetNewsDataLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetialsScreen(image: state.getNewsData.articles![index].urlToImage.toString(), title: state.getNewsData.articles![index].title.toString(),content: state.getNewsData.articles![index].content.toString(),publishAt: state.getNewsData.articles![index].publishedAt.toString(),)));
                    },
                    child: Articlewidget(
                        imageUrl: state.getNewsData.articles![index].urlToImage
                            .toString(),
                        title:
                            state.getNewsData.articles![index].title.toString(),
                        publishedAt: state
                            .getNewsData.articles![index].publishedAt
                            .toString()),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.getNewsData.articles!.length),
          );
        } else if (state is GetNewsDataError) {
          return Text(
            state.msg,
            style: const TextStyle(color: Colors.red, fontSize: 22),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    )
    );
  }
}
