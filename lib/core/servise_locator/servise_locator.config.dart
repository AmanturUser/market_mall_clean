import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import '../../feature/product_feature/data/data_sourse/product_server.dart'
    as _i3;
import '../../feature/product_feature/data/repositories/product_repository.dart'
    as _i4;
import '../../feature/product_feature/domain/repository/repository.dart' as _i5;
import '../../feature/product_feature/domain/use_case/load_products.dart'
    as _i6;
import '../../feature/product_feature/presentation/bloc/product_bloc.dart'
    as _i7;
import '../../feature/auth/domain/use_case/sign_in.dart'
    as _i8;
import '../../feature/dashBoard_feature/presentation/bloc/dashboard_bloc.dart'
    as _i18;
import '../../feature/dashboard_feature/domain/repository/repository.dart'
    as _i17;
import '../../feature/dashboard_feature/domain/use_case/get_categories.dart'
    as _i16;
import '../../feature/auth/data/data_sourse/auth_server.dart' as _i13;
import '../../feature/auth/data/repositories/auth_repository.dart' as _i9;
import '../../feature/auth/domain/repository/repository.dart' as _i10;
import '../../feature/auth/domain/use_case/sign_up.dart' as _i11;
import '../../feature/auth/presentation/bloc/auth_bloc.dart' as _i12;
import '../../feature/dashboard_feature/data/data_sourse/dashboard_server.dart'
    as _i14;
import '../../feature/dashboard_feature/data/repositories/dashboard_repository.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ProductDataSourse>(() => _i3.ProductDataSourse());
    gh.factory<_i5.ProductRepository>(() => _i4.ProductRepositoryImpl(
        productDataSourse: gh<_i3.ProductDataSourse>()));
    gh.factory<_i6.LoadProducts>(
        () => _i6.LoadProducts(productRepository: gh<_i5.ProductRepository>()));
    gh.factory<_i7.ProductBloc>(
        () => _i7.ProductBloc(loadProducts: gh<_i6.LoadProducts>()));

    gh.factory<_i13.AuthSourse>(() => _i13.AuthSourse());

    gh.factory<_i10.AuthRepository>(
        () => _i9.AuthRepositoryImpl(authSourse: gh<_i13.AuthSourse>()));

    gh.factory<_i8.SignIn>(
        () => _i8.SignIn(authRepository: gh<_i10.AuthRepository>()));
    gh.factory<_i11.SignUp>(
        () => _i11.SignUp(authRepository: gh<_i10.AuthRepository>()));

    gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(
          signIn: gh<_i8.SignIn>(),
          signUp: gh<_i11.SignUp>(),
        ));

    gh.factory<_i14.DashboardSourse>(() => _i14.DashboardSourse());
    gh.factory<_i17.DashboardRepository>(() => _i15.DashboardRepositoryImpl(
        dashboardSourse: gh<_i14.DashboardSourse>()));
    gh.factory<_i16.GetCategories>(() => _i16.GetCategories(
        dashboardRepository: gh<_i17.DashboardRepository>()));


    gh.factory<_i18.DashboardBloc>(
      () => _i18.DashboardBloc(
        getCategories: gh<_i16.GetCategories>(),
      ),
    );

    return this;
  }
}
