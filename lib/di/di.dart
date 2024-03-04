import 'package:dio/dio.dart';
import 'package:wiki_work_assignment/domain/mappers/album_mapper.dart';
import 'package:wiki_work_assignment/domain/mappers/photo_mapper.dart';
import 'package:wiki_work_assignment/domain/repositories/album_repository.dart';
import 'package:wiki_work_assignment/domain/repositories/album_repository_impl.dart';
import 'package:wiki_work_assignment/domain/repositories/photo_repository.dart';
import 'package:wiki_work_assignment/domain/repositories/photo_repository_impl.dart';
import 'package:wiki_work_assignment/domain/usecases/add_album_usecase.dart';
import 'package:wiki_work_assignment/domain/usecases/album_usecases.dart';
import 'package:wiki_work_assignment/domain/usecases/delete_album_usecase.dart';
import 'package:wiki_work_assignment/domain/usecases/get_album_usecase.dart';
import 'package:wiki_work_assignment/domain/usecases/get_photos_usecase.dart';
import 'package:wiki_work_assignment/domain/usecases/photo_usecases.dart';
import 'package:wiki_work_assignment/main.dart';
import 'package:wiki_work_assignment/presentation/gallery/gallery_bloc.dart';
import 'package:wiki_work_assignment/presentation/home/home_bloc.dart';
import 'package:wiki_work_assignment/services/rest_client.dart';

class DependencyInjection {
  static final _instance = DependencyInjection._();

  DependencyInjection._();

  factory DependencyInjection() => _instance;

  void init() {
    initNoDependencyClasses();
    initMappers();
    initRepositories();
    initUsecases();
    initBlocs();
  }

  void initNoDependencyClasses() {
    getIt.registerFactory(() => Dio());
    getIt.registerSingleton<RestClient>(RestClient(getIt<Dio>()));
  }

  void initMappers() {
    getIt.registerSingleton<PhotoMapper>(PhotoMapper());
    getIt.registerSingleton<AlbumMapper>(AlbumMapper());
  }

  void initRepositories() {
    getIt.registerSingleton<PhotoRepository>(
        PhotoRepositoryImpl(getIt<RestClient>()));
    getIt.registerSingleton<AlbumRepository>(
        AlbumRepositoryImpl(getIt<RestClient>()));
  }

  void initUsecases() {
    getIt.registerSingleton<GetAlbumsUseCase>(GetAlbumUseCaseImpl(
      getIt<AlbumRepository>(),
      getIt<AlbumMapper>(),
    ));
    getIt.registerSingleton<AddAlbumUseCase>(AddAlbumUseCaseImpl(
      getIt<AlbumRepository>(),
    ));
    getIt.registerSingleton<GetPhotosUseCase>(GetPhotosUseCaseImpl(
      getIt<PhotoRepository>(),
      getIt<PhotoMapper>(),
    ));
    getIt.registerSingleton<DeleteAlbumUseCase>(DeleteAlbumUseCaseImpl(
      getIt<AlbumRepository>(),
    ));
  }

  void initBlocs() {
    getIt.registerSingleton<HomeBloc>(HomeBloc());
    getIt.registerSingleton<GalleryBloc>(GalleryBloc());
  }
}
