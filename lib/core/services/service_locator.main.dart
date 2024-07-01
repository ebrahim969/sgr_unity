part of 'service_locator.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  initAuth();
  initBlog();
  initSearch();
  initProfile();
  initUserSavedBlogs();

  final supabase = await Supabase.initialize(
    anonKey: AppSecrets.supabaseAnonKey,
    url: AppSecrets.supabaseUrl,
  );

  Hive.defaultDirectory = (await getApplicationCacheDirectory()).path;

  sl.registerLazySingleton(() => supabase.client);
  sl.registerLazySingleton(() => Hive.box(name: 'blogs'));
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory(() => CacheHelper());
  sl<CacheHelper>().init();
  //Core

  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(sl()));
}

void initAuth() {
  // DataSource

  sl
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()))
    ..registerFactory<UserInfoLocalDataSource>(()=> UserInfoLocalDataSourceImpl(Hive.box(name: 'user')))
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    )

    // UseCase
    ..registerFactory(() => UserSignUp(sl()))
    ..registerFactory(() => UserSignIn(sl()))
    ..registerFactory(() => CurrentUser(sl()))
    ..registerFactory(() => UserSignOut(sl()))

    // Bloc
    ..registerLazySingleton(() => GetCurrentUserBloc(
          currentUser: sl(),
        ))
    ..registerLazySingleton(() => AuthBloc(
          userSignUp: sl(),
          userSignIn: sl(),
          userSignOut: sl(),
          getCurrentuserBloc: sl(),
        ));
}

void initBlog() {
  // DataSource
  sl
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(sl()),
    )
    ..registerFactory<BlogLocalDataSource>(() => BlogLocalDataSourceImpl(sl()))
    // Repository
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => UploadBlog(sl()),
    )
    ..registerFactory(() => GetAllBlogs(sl()))
    ..registerFactory(() => GetTopicBlogs(sl()))
    ..registerFactory(() => DeleteBlog(sl()))
    ..registerFactory(() => UpdateBlog(sl()))
    // Bloc
    ..registerLazySingleton(
      () => BlogBloc(
        uploadBlog: sl(),
        getAllBlogs: sl(),
        getTopicBlogs: sl(),
        deleteBlog: sl(),
        updateBlog: sl(),
        profileBloc: sl(),
      ),
    );
}

void initProfile() {
  //
  sl
    ..registerFactory<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(sl()))
    ..registerFactory<ProfileRepository>(
        () => ProfileRepositoryImpl(sl(), sl()))
    //
    ..registerFactory(() => GetUserBlogs(sl()))
    ..registerFactory(() => UpdateUserData(sl()))
    ..registerFactory(() => GetAnyUserInfo(sl()))
    ..registerFactory(() => GetAnyUserBlogs(sl()))

    // Bloc
    ..registerLazySingleton(() => ProfileBloc(
          getUserBlogs: sl(),
          updateUserData: sl(),
          getCurrentuserBloc: sl(),
        ))
    ..registerLazySingleton(() => GetAnyUserInfoBloc(getAnyUserInfo: sl()))
    ..registerLazySingleton(() => GetAnyUserBlogsBloc(getAnyUserBlogs: sl()));
}

void initSearch() {
  // DataSource
  sl
    ..registerFactory<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()),
    )
    // Repository
    ..registerFactory<SearchRepository>(
      () => SearchRepositoryImpl(
        sl(),
        sl(),
      ),
    )
    // UseCase
    ..registerFactory(
      () => BlogsSearch(sl()),
    )
    // Bloc
    ..registerLazySingleton(
      () => SearchBloc(blogsSearch: sl()),
    );
}

void initUserSavedBlogs() {
  // DataSource
  sl
    ..registerFactory<UserSavedBlogsRemoteDataSource>(
      () => UserSavedBlogsRemoteDataSourceImpl(sl()),
    )
    // Repository
    ..registerFactory<UserSavedBlogsRepository>(
      () => UserSavedBlogsRepositoryImpl(
        sl(),
        sl(),
      ),
    )
    // UseCase
    ..registerFactory(() => ToggleSavedUserBlog(sl()))
    ..registerFactory(() => FetchSavedUserBlogsId(sl()))
    ..registerFactory(() => GetUserSavedBlogs(sl()))
    // Bloc
    ..registerLazySingleton(
      () => UserSavedBlogsBloc(
          toggleSavedUserBlog: sl(),
          fetchSavedUserBlogs: sl(),
          getUserSavedBlogs: sl()),
    );
}
