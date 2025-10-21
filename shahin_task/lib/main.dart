import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_cubit.dart';
import 'package:shahin_task/page/filtering_page.dart';
import 'package:shahin_task/page/wrapper_page.dart';
import 'package:shahin_task/utils/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WrapperPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppConstants.filteringPage,
          builder: (BuildContext context, GoRouterState state) {
            return const FilteringPage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: "Tajawal"),
      ),
    );
  }
}
