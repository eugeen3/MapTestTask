import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:map_test_task/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
