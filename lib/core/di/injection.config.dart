// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repository/map_objects_repository.dart' as _i4;
import '../../presentation/ui/cubit/map_markers_cubit.dart' as _i5;
import 'module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.GraphQLClient>(appModule.graphQLClient);
  gh.singleton<_i4.MapMarkersRepository>(
      _i4.MapMarkersRepository(get<_i3.GraphQLClient>()));
  gh.singleton<_i5.MapMarkersCubit>(
      _i5.MapMarkersCubit(get<_i4.MapMarkersRepository>()));
  return get;
}

class _$AppModule extends _i6.AppModule {}
