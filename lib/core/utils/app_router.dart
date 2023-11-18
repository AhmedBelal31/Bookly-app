import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';

  static const kBookDetailsView = '/BookDetailsView';

  static const kSearchView = '/kSearchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    // GoRoute(
    //   path: kBookDetailsView,
    //   builder: (context, state) => BlocProvider(
    //     create:(context)=>SimilarBookCubit(
    //       getIt.get<HomeRepoImpl>(),
    //     ),
    //     child: BookDetailsView(
    //       bookModel:state.extra as BookModel,
    //       //index:int.parse(state.pathParameters['index']!) ,
    //
    //     ),
    //   ),
    // ),
  ]);
}
