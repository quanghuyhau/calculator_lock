// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:calculator_lock/data/data_source/local/local_storage.dart'
    as _i1038;
import 'package:calculator_lock/data/data_source/local/pref/shared_preferences_manager.dart'
    as _i444;
import 'package:calculator_lock/data/data_source/services/api_service.dart'
    as _i554;
import 'package:calculator_lock/data/repositories/login_repo_impl.dart'
    as _i1004;
import 'package:calculator_lock/di/environment/build_config.dart' as _i74;
import 'package:calculator_lock/di/environment/build_config_prod.dart' as _i951;
import 'package:calculator_lock/di/environment/build_config_uat.dart' as _i706;
import 'package:calculator_lock/di/module/conponents_module.dart' as _i548;
import 'package:calculator_lock/di/module/network_module.dart' as _i708;
import 'package:calculator_lock/domain/repositories/login_repository.dart'
    as _i849;
import 'package:calculator_lock/domain/use_cases/login_usecase.dart' as _i360;
import 'package:calculator_lock/presentation/common/toast/toast_widget.dart'
    as _i637;
import 'package:calculator_lock/presentation/screens/login/cubit/login_cubit.dart'
    as _i975;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _uat = 'uat';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final componentModule = _$ComponentModule();
    gh.factory<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i554.ApiService>(() => networkModule.adminService);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => componentModule.prefs,
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(() => componentModule.secureStorage);
    gh.lazySingleton<_i637.ToastWidget>(() => _i637.ToastWidget());
    gh.singleton<_i444.SharedPreferencesManager>(() =>
        _i444.SharedPreferencesManager(pref: gh<_i460.SharedPreferences>()));
    gh.factory<_i74.BuildConfig>(
      () => _i706.BuildConfigBeta(),
      registerFor: {_uat},
    );
    gh.factory<_i1038.LocalStorage>(() => _i1038.LocalStorage(
          preferences: gh<_i444.SharedPreferencesManager>(),
          secureStorage: gh<_i558.FlutterSecureStorage>(),
        ));
    gh.factory<_i74.BuildConfig>(
      () => _i951.BuildConfigProd(),
      registerFor: {_prod},
    );
    gh.factory<_i849.LoginRepository>(() => _i1004.LoginRepositoryImpl(
          apiService: gh<_i554.ApiService>(),
          localStorage: gh<_i1038.LocalStorage>(),
        ));
    gh.factory<_i360.LoginUseCase>(
        () => _i360.LoginUseCase(loginRepository: gh<_i849.LoginRepository>()));
    gh.factory<_i975.LoginCubit>(
        () => _i975.LoginCubit(loginUseCase: gh<_i360.LoginUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i708.NetworkModule {}

class _$ComponentModule extends _i548.ComponentModule {}
