import 'package:auto_route/auto_route.dart';
import 'package:market_mall_flutter_bloc/feature/dashBoard_feature/presentation/dashboard.dart';
import 'package:market_mall_flutter_bloc/splash_page/splash_page.dart';
import '../../feature/auth/presentation/sign_in/sign_in_screen.dart';
import '../../feature/auth/presentation/sign_up/sign_up_screen.dart';
import '../../feature/product_feature/presentation/product_page/products_page.dart';
import '../../home/home_page.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes=>[
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: HomeRoute.page,children: [
      AutoRoute(page: ProductListRoute.page),
      AutoRoute(page: DashBoardRoute.page)
      /*AutoRoute(page: UserListRoute.page),
      AutoRoute(page: ProductListRoute.page),
      AutoRoute(page: TodoTasksRoute.page),*/
    ]),
  ];
}