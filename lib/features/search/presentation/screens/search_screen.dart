import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';
import 'package:news/presentation/widget/articlle_widget.dart';

import '../../../../presentation/screens/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {
                  SearchCubit.get(context).getSearchResult(value);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), label: Text("Search")),
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
              if (state is SearchStateIsloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchStateLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetialsScreen(image: state.getNewsData.articles![index].urlToImage.toString(), title: state.getNewsData.articles![index].title.toString(),content: state.getNewsData.articles![index].content.toString(),publishAt: state.getNewsData.articles![index].publishedAt.toString(),)));
                          },
                          child: Articlewidget(
                              imageUrl: state
                                  .getNewsData.articles![index].urlToImage
                                  .toString(),
                              title: state.getNewsData.articles![index].title
                                  .toString(),
                              publishedAt: state
                                  .getNewsData.articles![index].publishedAt
                                  .toString()),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.getNewsData.articles!.length),
                );
              }
              return const  Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Not Item to search for it"),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
