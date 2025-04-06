import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/usecases/pix/create_pix_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/pix/check_pix_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/pix/pix_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pixProvider =
    StateNotifierProvider<PixNotifier, AsyncValue<dynamic>>((ref) {
  return PixNotifier(
    ref.watch(createPixUseCaseProvider),
    ref.watch(checkPixUseCaseProvider),
  );
});

class PixNotifier extends StateNotifier<AsyncValue<dynamic>> {
  final CreatePixUseCase _createPixUseCase;
  final CheckPixUsecase _checkPixUsecase;

  PixNotifier(this._createPixUseCase, this._checkPixUsecase)
      : super(const AsyncValue.loading());

  Future<void> createPix(
      int amount, int expiresIn, String description, Customer customer) async {
    try {
      state = const AsyncValue.loading();
      final pixResponse = await _createPixUseCase.execute(
          amount, expiresIn, description, customer);
      state = AsyncValue.data(pixResponse);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> checkPix(String pixId) async {
    try {
      state = const AsyncValue.loading();
      final pixResponse = await _checkPixUsecase.execute(pixId);
      state = AsyncValue.data(pixResponse);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
