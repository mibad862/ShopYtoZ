import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_y_z/auth/auth_service.dart';
import 'package:shop_y_z/pages/add_telescope_page.dart';
import 'package:shop_y_z/pages/brand_page.dart';
import 'package:shop_y_z/pages/dashboard_page.dart';
import 'package:shop_y_z/pages/login_page.dart';
import 'package:shop_y_z/pages/view_telescope_page.dart';
import 'package:shop_y_z/providers/telescope_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TelescopeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: DashboardPage.routeName,
    redirect: (context, state) {
      if (AuthService.currentUser == null) {
        return LoginPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: DashboardPage.routeName,
        name: DashboardPage.routeName,
        builder: (context, state) => const DashboardPage(),
        routes: [
          GoRoute(
            path: AddTelescopePage.routeName,
            name: AddTelescopePage.routeName,
            builder: (context, state) => const AddTelescopePage(),
          ),
          GoRoute(
            path: ViewTelescopePage.routeName,
            name: ViewTelescopePage.routeName,
            builder: (context, state) => const ViewTelescopePage(),
          ),
          GoRoute(
            path: BrandPage.routeName,
            name: BrandPage.routeName,
            builder: (context, state) => const BrandPage(),
          ),
        ],
      ),
      GoRoute(
        path: LoginPage.routeName,
        name: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
