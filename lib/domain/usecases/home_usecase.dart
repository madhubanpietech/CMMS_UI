import 'package:cmms/domain/domain.dart';

class HomeUsecase {
  final Repository _repository;

  HomeUsecase(this._repository);

  Future<void> generateToken() async {
    return _repository.generateToken();
  }

  Future<List<InventoryList>> getInventoryList({
    required bool isLoading,
  }) async {
    return _repository.getInventoryList(isLoading: isLoading);
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return _repository.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return _repository.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }
}
