part of 'auto_route.dart';


abstract class _$AppRouter extends RootStackRouter{
  @override
  final Map<String, PageFactory> pagesMap={
    SplashRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SplashPage()
      );
    },
    HomeRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const HomePage()
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    ProductListRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const ProductsPage()
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Dashboard(),
      );
    },
  };
}

class SplashRoute extends PageRouteInfo<void>{
  static const String name='Splash';
  static const PageInfo<void> page=PageInfo<void>(name);
  const SplashRoute({List<PageRouteInfo>? children}): super(SplashRoute.name,initialChildren: children);
}

class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
    SignInRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignInRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
    SignUpRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignUpRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class HomeRoute extends PageRouteInfo<void>{
  static const String name='Home';
  static const PageInfo<void> page=PageInfo<void>(name);
  const HomeRoute({List<PageRouteInfo>? children}): super(HomeRoute.name,initialChildren: children);
}

class ProductListRoute extends PageRouteInfo<void>{
  static const String name='ProductList';
  static const PageInfo<void> page=PageInfo<void>(name);
  const ProductListRoute({List<PageRouteInfo>? children}): super(ProductListRoute.name,initialChildren: children);
}

class DashboardRoute extends PageRouteInfo<void>{
  static const String name='Dashboard';
  static const PageInfo<void> page=PageInfo<void>(name);
  const DashboardRoute({List<PageRouteInfo>? children}): super(DashboardRoute.name,initialChildren: children);
}

