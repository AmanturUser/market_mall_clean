import 'package:auto_route/auto_route.dart';
import 'package:market_mall_flutter_bloc/feature/dashBoard_feature/presentation/dashboard/dashboard.dart';
import '../../feature/auth/presentation/sign_in/sign_in_screen.dart';
import '../../feature/auth/presentation/sign_up/sign_up_screen.dart';
import '../../feature/home_feature/presentation/home_page.dart';
import '../../feature/product_feature/presentation/product_page/products_page.dart';
import '../../feature/splash_feature/presentation/splash_page.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes=>[
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: HomeRoute.page,children: [
      AutoRoute(page: DashboardRoute.page),
      AutoRoute(page: ProductListRoute.page),

    ]),
  ];
}