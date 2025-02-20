import 'package:champions_chromo_app/data/repositories/school_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/school_repository.dart';
import 'package:champions_chromo_app/presentation/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final schoolRepositoryProvider = Provider<SchoolRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SchoolRepositoryImpl(dio);
});
