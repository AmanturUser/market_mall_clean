import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/core/servise_locator/servise_locator.config.dart';

final getIt=GetIt.instance;

@InjectableInit(
  initializerName:'init',
  preferRelativeImports: true,
  asExtension:true,
)
void configureDependencies() => getIt.init();