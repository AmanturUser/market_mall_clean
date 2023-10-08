import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:market_mall_flutter_bloc/feature/auth/domain/use_case/sign_in.dart';

import '../../feature/auth/data/data_sourse/auth_server.dart';
import '../../feature/auth/data/repositories/auth_repository.dart';
import '../../feature/auth/domain/repository/repository.dart';
import '../../feature/auth/domain/use_case/sign_up.dart';
import '../../feature/auth/presentation/bloc/auth_bloc.dart';
import '../../feature/product_feature/data/data_sourse/product_server.dart'
    as _i3;
import '../../feature/product_feature/data/repositories/product_repository.dart'
    as _i4;
import '../../feature/product_feature/domain/repository/repository.dart' as _i5;
import '../../feature/product_feature/domain/use_case/load_products.dart'
    as _i6;
import '../../feature/product_feature/presentation/bloc/product_bloc.dart'
    as _i7;

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

    gh.factory<AuthSourse>(() => AuthSourse());

    gh.factory<AuthRepository>(
        () => AuthRepositoryImpl(authSourse: gh<AuthSourse>()));

    gh.factory<SignIn>(() => SignIn(authRepository: gh<AuthRepository>()));
    gh.factory<SignUp>(() => SignUp(authRepository: gh<AuthRepository>()));

    gh.factory<AuthBloc>(() => AuthBloc(
          signIn: gh<SignIn>(),
          signUp: gh<SignUp>(),
        ));

    return this;
  }
}
