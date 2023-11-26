

import 'package:get_it/get_it.dart';
import 'package:tnpd/global/cubit/auth/auth_cubit.dart';
import 'package:tnpd/presentation/feed/cubit/feed/feed_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static initializeDependencies() async {

     sl.registerSingleton<AuthCubit>(AuthCubit());
     sl.registerLazySingleton<FeedCubit>(() => FeedCubit());
     
  }
}