import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

class PermitTypeUsecase {
  PermitTypeUsecase(this.repository);
  Repository repository;

   Future<List<FacilityModel?>?> getFacilityList() async =>
      await repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await repository.getUserAccessData(LocalKeys.userAccess);

  Future<List<TypePermitModel?>?> getTypePermitList(bool? isLoading) async =>
      await repository.getTypePermitList(isLoading);

       
}
