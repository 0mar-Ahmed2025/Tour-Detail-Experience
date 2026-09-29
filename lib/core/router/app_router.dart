import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/tour_detail/data/datasources/tour_local_data_source.dart';
import '../../features/tour_detail/data/datasources/tour_remote_data_source.dart';
import '../../features/tour_detail/data/repositories/tour_repository_impl.dart';
import '../../features/tour_detail/presentation/cubit/tour_detail_cubit.dart';
import '../../features/tour_detail/presentation/screens/tour_detail_screen.dart';
import '../constants/api_constants.dart';
import '../network/dio_client.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/tours/${ApiConstants.testSlug}',
    routes: [
      GoRoute(
        path: '/tours/:slug',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? ApiConstants.testSlug;

          final dioClient = DioClient();
          final remoteDataSource = TourRemoteDataSourceImpl(
            dioClient: dioClient,
          );
          final localDataSource = const TourLocalDataSourceImpl();
          final repository = TourRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
          );

          return BlocProvider(
            create: (context) => TourDetailCubit(repository: repository),
            child: TourDetailScreen(slug: slug),
          );
        },
      ),
    ],
  );
}
