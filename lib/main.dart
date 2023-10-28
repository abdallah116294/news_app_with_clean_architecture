import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/layout/business/presentation/cubit/business_cubit.dart';
import 'package:news/features/layout/science/presentation/cubit/science_cubit.dart';
import 'package:news/features/search/presentation/cubit/search_cubit.dart';
import 'package:news/injection_container.dart' as di;
import 'package:news/presentation/cubit/get_news_data_cubit.dart';
import 'features/layout/presentation/layout_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // DioHepler.init();
  // DioHepler(di.sl<Dio>()).get();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<GetNewsDataCubit>()..getNewsData()),
          BlocProvider(create: (_) => di.sl<BusinessCubit>()),
          BlocProvider(create: (_)=>di.sl<ScienceCubit>()),
          BlocProvider(create: (_)=>di.sl<SearchCubit>())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LayoutScreen(),
        ));
  }
}
