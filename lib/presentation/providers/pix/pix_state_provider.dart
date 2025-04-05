import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_response_entity.dart';
import 'package:champions_chromo_app/domain/usecases/pix/create_pix_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/pix/pix_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pixProvider = StateNotifierProvider<PixNotifier, AsyncValue<PixResponse>>((ref) {
  return PixNotifier(ref.watch(createPixUseCaseProvider));
});

class PixNotifier extends StateNotifier<AsyncValue<PixResponse>> {
  final CreatePixUseCase _createPixUseCase;

  PixNotifier(this._createPixUseCase) : super(const AsyncValue.loading());

  Future<void> createPix(int amount, int expiresIn, String description, Customer customer) async {
    try {
    state = const AsyncValue.loading();
      final pixResponse = await _createPixUseCase.execute(amount, expiresIn, description, customer);
      state = AsyncValue.data(pixResponse);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
