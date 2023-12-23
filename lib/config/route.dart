import 'package:go_router/go_router.dart';
import 'package:json_proudects_app/pages/ProductsDeitals.dart';
import 'package:json_proudects_app/pages/home_page.dart';
import 'package:json_proudects_app/pages/login_page.dart';
import 'package:json_proudects_app/pages/CategoryProducts.dart';
import 'package:json_proudects_app/pages/searching_page.dart';
import 'package:json_proudects_app/pages/splashscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
      routes: [
        GoRoute(
          path: 'LogIn',
          builder: (context, state) => LogInPage(),
        ),
        GoRoute(
            path: 'HomePage',
            builder: (context, state) => HomePage(),
            routes: [
              GoRoute(
                path: 'SearchingPage',
                builder: (context, state) => SearchingPage(),
              ),
              GoRoute(
                path: 'CategoryProducts',
                builder: (context, state) => CategoryProducts(),
              ),
              GoRoute(path: 'ProductsDeitals',
              builder: (context, state) => ProductsDeitals(),
              )
            ]),
      ],
    ),
  ],
);
