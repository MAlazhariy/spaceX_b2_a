// import 'dart:convert';
//
// import 'package:djibouti_press/view/screens/home/home_screen.dart';
// import 'package:fluro/fluro.dart';
// import 'package:djibouti_press/view/base/screen_not_found.dart';
// import 'package:djibouti_press/utils/routes.dart';
//
// class RouterHelper {
//   /// Routes
//   static const String dashboardScreen = '/dashboard';
//   static const String homeScreen = '/';
//
//   /// Routes Getters
//   static String getHomeScreen() {
//     return homeScreen;
//   }
//
//
//   /// Router
//   static final FluroRouter router = FluroRouter();
//   // static final goRouter = GoRouter(
//   //   routes: [
//   //     GoRoute(
//   //       path: homeScreen,
//   //       builder: (context, state) => const HomeScreen(),
//   //     ),
//   //   ],
//   // );
//
//   /// HANDLERS
//   static final Handler _notFoundHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
//     return const ScreenNotFound();
//   });
//
//   // static final Handler _splashHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
//   //   return const SplashScreen();
//   // });
//
//   static final Handler _homeHandler = Handler(handlerFunc: (context, Map<String, List<String>> params) {
//     return const HomeScreen();
//   });
//
//
//   /// INIT DEFINE ROUTES
//   static void init() {
//     router.notFoundHandler = _notFoundHandler;
//     // router.define(Routes.splashScreen, handler: _splashHandler, transitionType: TransitionType.fadeIn);
//     router.define(Routes.homeScreen, handler: _homeHandler, transitionType: TransitionType.fadeIn);
//   }
//
//   /// params handlers
//   static Map<String, dynamic> getDataFrom(String data) {
//     // base64url -> utf8 -> encoded json -> map
//     final utf = base64Url.decode(data);
//     final json = utf8.decode(utf);
//     return jsonDecode(json);
//   }
//
//   static String getBase64From(Map<String, dynamic> map) {
//     final json = jsonEncode(map);
//     final utf = utf8.encode(json);
//     return base64Url.encode(utf);
//   }
// }
