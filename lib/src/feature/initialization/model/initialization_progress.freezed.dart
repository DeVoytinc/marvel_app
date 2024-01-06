// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initialization_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepositoriesStore {
  MarvelHeroesRepository get marvelHeroesRepository =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositoriesStoreCopyWith<RepositoriesStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoriesStoreCopyWith<$Res> {
  factory $RepositoriesStoreCopyWith(
          RepositoriesStore value, $Res Function(RepositoriesStore) then) =
      _$RepositoriesStoreCopyWithImpl<$Res, RepositoriesStore>;
  @useResult
  $Res call({MarvelHeroesRepository marvelHeroesRepository});
}

/// @nodoc
class _$RepositoriesStoreCopyWithImpl<$Res, $Val extends RepositoriesStore>
    implements $RepositoriesStoreCopyWith<$Res> {
  _$RepositoriesStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marvelHeroesRepository = null,
  }) {
    return _then(_value.copyWith(
      marvelHeroesRepository: null == marvelHeroesRepository
          ? _value.marvelHeroesRepository
          : marvelHeroesRepository // ignore: cast_nullable_to_non_nullable
              as MarvelHeroesRepository,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoriesStoreImplCopyWith<$Res>
    implements $RepositoriesStoreCopyWith<$Res> {
  factory _$$RepositoriesStoreImplCopyWith(_$RepositoriesStoreImpl value,
          $Res Function(_$RepositoriesStoreImpl) then) =
      __$$RepositoriesStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MarvelHeroesRepository marvelHeroesRepository});
}

/// @nodoc
class __$$RepositoriesStoreImplCopyWithImpl<$Res>
    extends _$RepositoriesStoreCopyWithImpl<$Res, _$RepositoriesStoreImpl>
    implements _$$RepositoriesStoreImplCopyWith<$Res> {
  __$$RepositoriesStoreImplCopyWithImpl(_$RepositoriesStoreImpl _value,
      $Res Function(_$RepositoriesStoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marvelHeroesRepository = null,
  }) {
    return _then(_$RepositoriesStoreImpl(
      marvelHeroesRepository: null == marvelHeroesRepository
          ? _value.marvelHeroesRepository
          : marvelHeroesRepository // ignore: cast_nullable_to_non_nullable
              as MarvelHeroesRepository,
    ));
  }
}

/// @nodoc

class _$RepositoriesStoreImpl implements _RepositoriesStore {
  const _$RepositoriesStoreImpl({required this.marvelHeroesRepository});

  @override
  final MarvelHeroesRepository marvelHeroesRepository;

  @override
  String toString() {
    return 'RepositoriesStore(marvelHeroesRepository: $marvelHeroesRepository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoriesStoreImpl &&
            (identical(other.marvelHeroesRepository, marvelHeroesRepository) ||
                other.marvelHeroesRepository == marvelHeroesRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, marvelHeroesRepository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoriesStoreImplCopyWith<_$RepositoriesStoreImpl> get copyWith =>
      __$$RepositoriesStoreImplCopyWithImpl<_$RepositoriesStoreImpl>(
          this, _$identity);
}

abstract class _RepositoriesStore implements RepositoriesStore {
  const factory _RepositoriesStore(
          {required final MarvelHeroesRepository marvelHeroesRepository}) =
      _$RepositoriesStoreImpl;

  @override
  MarvelHeroesRepository get marvelHeroesRepository;
  @override
  @JsonKey(ignore: true)
  _$$RepositoriesStoreImplCopyWith<_$RepositoriesStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DependenciesStore {
  AppRouter get router => throw _privateConstructorUsedError;
  AppDatabase get database => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DependenciesStoreCopyWith<DependenciesStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DependenciesStoreCopyWith<$Res> {
  factory $DependenciesStoreCopyWith(
          DependenciesStore value, $Res Function(DependenciesStore) then) =
      _$DependenciesStoreCopyWithImpl<$Res, DependenciesStore>;
  @useResult
  $Res call({AppRouter router, AppDatabase database});
}

/// @nodoc
class _$DependenciesStoreCopyWithImpl<$Res, $Val extends DependenciesStore>
    implements $DependenciesStoreCopyWith<$Res> {
  _$DependenciesStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? router = null,
    Object? database = null,
  }) {
    return _then(_value.copyWith(
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as AppRouter,
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as AppDatabase,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DependenciesStoreImplCopyWith<$Res>
    implements $DependenciesStoreCopyWith<$Res> {
  factory _$$DependenciesStoreImplCopyWith(_$DependenciesStoreImpl value,
          $Res Function(_$DependenciesStoreImpl) then) =
      __$$DependenciesStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppRouter router, AppDatabase database});
}

/// @nodoc
class __$$DependenciesStoreImplCopyWithImpl<$Res>
    extends _$DependenciesStoreCopyWithImpl<$Res, _$DependenciesStoreImpl>
    implements _$$DependenciesStoreImplCopyWith<$Res> {
  __$$DependenciesStoreImplCopyWithImpl(_$DependenciesStoreImpl _value,
      $Res Function(_$DependenciesStoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? router = null,
    Object? database = null,
  }) {
    return _then(_$DependenciesStoreImpl(
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as AppRouter,
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as AppDatabase,
    ));
  }
}

/// @nodoc

class _$DependenciesStoreImpl extends _DependenciesStore {
  const _$DependenciesStoreImpl({required this.router, required this.database})
      : super._();

  @override
  final AppRouter router;
  @override
  final AppDatabase database;

  @override
  String toString() {
    return 'DependenciesStore(router: $router, database: $database)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DependenciesStoreImpl &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType, router, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DependenciesStoreImplCopyWith<_$DependenciesStoreImpl> get copyWith =>
      __$$DependenciesStoreImplCopyWithImpl<_$DependenciesStoreImpl>(
          this, _$identity);
}

abstract class _DependenciesStore extends DependenciesStore {
  const factory _DependenciesStore(
      {required final AppRouter router,
      required final AppDatabase database}) = _$DependenciesStoreImpl;
  const _DependenciesStore._() : super._();

  @override
  AppRouter get router;
  @override
  AppDatabase get database;
  @override
  @JsonKey(ignore: true)
  _$$DependenciesStoreImplCopyWith<_$DependenciesStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitializationProgress {
  IEnvironmentStore get environment => throw _privateConstructorUsedError;
  AppRouter? get router => throw _privateConstructorUsedError;
  MarvelHeroesRepository? get marvelHeroesRepository =>
      throw _privateConstructorUsedError;
  AppDatabase? get database => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitializationProgressCopyWith<InitializationProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationProgressCopyWith<$Res> {
  factory $InitializationProgressCopyWith(InitializationProgress value,
          $Res Function(InitializationProgress) then) =
      _$InitializationProgressCopyWithImpl<$Res, InitializationProgress>;
  @useResult
  $Res call(
      {IEnvironmentStore environment,
      AppRouter? router,
      MarvelHeroesRepository? marvelHeroesRepository,
      AppDatabase? database});
}

/// @nodoc
class _$InitializationProgressCopyWithImpl<$Res,
        $Val extends InitializationProgress>
    implements $InitializationProgressCopyWith<$Res> {
  _$InitializationProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? environment = null,
    Object? router = freezed,
    Object? marvelHeroesRepository = freezed,
    Object? database = freezed,
  }) {
    return _then(_value.copyWith(
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as IEnvironmentStore,
      router: freezed == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as AppRouter?,
      marvelHeroesRepository: freezed == marvelHeroesRepository
          ? _value.marvelHeroesRepository
          : marvelHeroesRepository // ignore: cast_nullable_to_non_nullable
              as MarvelHeroesRepository?,
      database: freezed == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as AppDatabase?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializationProgressImplCopyWith<$Res>
    implements $InitializationProgressCopyWith<$Res> {
  factory _$$InitializationProgressImplCopyWith(
          _$InitializationProgressImpl value,
          $Res Function(_$InitializationProgressImpl) then) =
      __$$InitializationProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IEnvironmentStore environment,
      AppRouter? router,
      MarvelHeroesRepository? marvelHeroesRepository,
      AppDatabase? database});
}

/// @nodoc
class __$$InitializationProgressImplCopyWithImpl<$Res>
    extends _$InitializationProgressCopyWithImpl<$Res,
        _$InitializationProgressImpl>
    implements _$$InitializationProgressImplCopyWith<$Res> {
  __$$InitializationProgressImplCopyWithImpl(
      _$InitializationProgressImpl _value,
      $Res Function(_$InitializationProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? environment = null,
    Object? router = freezed,
    Object? marvelHeroesRepository = freezed,
    Object? database = freezed,
  }) {
    return _then(_$InitializationProgressImpl(
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as IEnvironmentStore,
      router: freezed == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as AppRouter?,
      marvelHeroesRepository: freezed == marvelHeroesRepository
          ? _value.marvelHeroesRepository
          : marvelHeroesRepository // ignore: cast_nullable_to_non_nullable
              as MarvelHeroesRepository?,
      database: freezed == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as AppDatabase?,
    ));
  }
}

/// @nodoc

class _$InitializationProgressImpl extends _InitializationProgress {
  const _$InitializationProgressImpl(
      {required this.environment,
      this.router,
      this.marvelHeroesRepository,
      this.database})
      : super._();

  @override
  final IEnvironmentStore environment;
  @override
  final AppRouter? router;
  @override
  final MarvelHeroesRepository? marvelHeroesRepository;
  @override
  final AppDatabase? database;

  @override
  String toString() {
    return 'InitializationProgress(environment: $environment, router: $router, marvelHeroesRepository: $marvelHeroesRepository, database: $database)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializationProgressImpl &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.marvelHeroesRepository, marvelHeroesRepository) ||
                other.marvelHeroesRepository == marvelHeroesRepository) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, environment, router, marvelHeroesRepository, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializationProgressImplCopyWith<_$InitializationProgressImpl>
      get copyWith => __$$InitializationProgressImplCopyWithImpl<
          _$InitializationProgressImpl>(this, _$identity);
}

abstract class _InitializationProgress extends InitializationProgress {
  const factory _InitializationProgress(
      {required final IEnvironmentStore environment,
      final AppRouter? router,
      final MarvelHeroesRepository? marvelHeroesRepository,
      final AppDatabase? database}) = _$InitializationProgressImpl;
  const _InitializationProgress._() : super._();

  @override
  IEnvironmentStore get environment;
  @override
  AppRouter? get router;
  @override
  MarvelHeroesRepository? get marvelHeroesRepository;
  @override
  AppDatabase? get database;
  @override
  @JsonKey(ignore: true)
  _$$InitializationProgressImplCopyWith<_$InitializationProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitializationResult {
  DependenciesStore get dependencies => throw _privateConstructorUsedError;
  RepositoriesStore get repositories => throw _privateConstructorUsedError;
  int get stepCount => throw _privateConstructorUsedError;
  int get msSpent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitializationResultCopyWith<InitializationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationResultCopyWith<$Res> {
  factory $InitializationResultCopyWith(InitializationResult value,
          $Res Function(InitializationResult) then) =
      _$InitializationResultCopyWithImpl<$Res, InitializationResult>;
  @useResult
  $Res call(
      {DependenciesStore dependencies,
      RepositoriesStore repositories,
      int stepCount,
      int msSpent});

  $DependenciesStoreCopyWith<$Res> get dependencies;
  $RepositoriesStoreCopyWith<$Res> get repositories;
}

/// @nodoc
class _$InitializationResultCopyWithImpl<$Res,
        $Val extends InitializationResult>
    implements $InitializationResultCopyWith<$Res> {
  _$InitializationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dependencies = null,
    Object? repositories = null,
    Object? stepCount = null,
    Object? msSpent = null,
  }) {
    return _then(_value.copyWith(
      dependencies: null == dependencies
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as DependenciesStore,
      repositories: null == repositories
          ? _value.repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as RepositoriesStore,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      msSpent: null == msSpent
          ? _value.msSpent
          : msSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DependenciesStoreCopyWith<$Res> get dependencies {
    return $DependenciesStoreCopyWith<$Res>(_value.dependencies, (value) {
      return _then(_value.copyWith(dependencies: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepositoriesStoreCopyWith<$Res> get repositories {
    return $RepositoriesStoreCopyWith<$Res>(_value.repositories, (value) {
      return _then(_value.copyWith(repositories: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitializationResultImplCopyWith<$Res>
    implements $InitializationResultCopyWith<$Res> {
  factory _$$InitializationResultImplCopyWith(_$InitializationResultImpl value,
          $Res Function(_$InitializationResultImpl) then) =
      __$$InitializationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DependenciesStore dependencies,
      RepositoriesStore repositories,
      int stepCount,
      int msSpent});

  @override
  $DependenciesStoreCopyWith<$Res> get dependencies;
  @override
  $RepositoriesStoreCopyWith<$Res> get repositories;
}

/// @nodoc
class __$$InitializationResultImplCopyWithImpl<$Res>
    extends _$InitializationResultCopyWithImpl<$Res, _$InitializationResultImpl>
    implements _$$InitializationResultImplCopyWith<$Res> {
  __$$InitializationResultImplCopyWithImpl(_$InitializationResultImpl _value,
      $Res Function(_$InitializationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dependencies = null,
    Object? repositories = null,
    Object? stepCount = null,
    Object? msSpent = null,
  }) {
    return _then(_$InitializationResultImpl(
      dependencies: null == dependencies
          ? _value.dependencies
          : dependencies // ignore: cast_nullable_to_non_nullable
              as DependenciesStore,
      repositories: null == repositories
          ? _value.repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as RepositoriesStore,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      msSpent: null == msSpent
          ? _value.msSpent
          : msSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitializationResultImpl implements _InitializationResult {
  const _$InitializationResultImpl(
      {required this.dependencies,
      required this.repositories,
      required this.stepCount,
      required this.msSpent});

  @override
  final DependenciesStore dependencies;
  @override
  final RepositoriesStore repositories;
  @override
  final int stepCount;
  @override
  final int msSpent;

  @override
  String toString() {
    return 'InitializationResult(dependencies: $dependencies, repositories: $repositories, stepCount: $stepCount, msSpent: $msSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializationResultImpl &&
            (identical(other.dependencies, dependencies) ||
                other.dependencies == dependencies) &&
            (identical(other.repositories, repositories) ||
                other.repositories == repositories) &&
            (identical(other.stepCount, stepCount) ||
                other.stepCount == stepCount) &&
            (identical(other.msSpent, msSpent) || other.msSpent == msSpent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dependencies, repositories, stepCount, msSpent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializationResultImplCopyWith<_$InitializationResultImpl>
      get copyWith =>
          __$$InitializationResultImplCopyWithImpl<_$InitializationResultImpl>(
              this, _$identity);
}

abstract class _InitializationResult implements InitializationResult {
  const factory _InitializationResult(
      {required final DependenciesStore dependencies,
      required final RepositoriesStore repositories,
      required final int stepCount,
      required final int msSpent}) = _$InitializationResultImpl;

  @override
  DependenciesStore get dependencies;
  @override
  RepositoriesStore get repositories;
  @override
  int get stepCount;
  @override
  int get msSpent;
  @override
  @JsonKey(ignore: true)
  _$$InitializationResultImplCopyWith<_$InitializationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
