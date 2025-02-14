import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/view_permit_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../../domain/usecases/preventive_list_usecase.dart';
import '../../domain/usecases/breakdown_usecase.dart';

class ViewPermitPresenter {
 ViewPermitPresenter(this.viewPermitUsecase);
  ViewPermitUsecase viewPermitUsecase;


   Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

   Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id,
  }) async {
    return viewPermitUsecase.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

   Future<List<EmployeeListModel>> getEmployeePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel>> getPermitIssuerList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getPermitIssuerList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

   Future<List<EmployeeListModel2>> getPermitApproverList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getPermitApproverList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

   Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return viewPermitUsecase.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

   Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return viewPermitUsecase.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

   Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );
  

   Future<List<InventoryDetailModel?>?> getInventoryDetailList({
    String? auth,
    // int? facilityId,
    int? id,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryDetailList(
        auth: auth ?? "",
        // facilityId: 45,
        // facilityId: facilityId ?? 0,
        id: id,
        isLoading: isLoading ?? false,
      );

  Future<NewPermitDetailModel?> getViewPermitDetail({
  
    bool? isLoading,  
    required int permitId,
  }) async {
      return viewPermitUsecase.getViewPermitDetail(
        permitId: permitId,
        isLoading: isLoading ?? false,
      );
  }




   Future<List<FacilityModel?>?> getFacilityLists() async =>
      await viewPermitUsecase.getFacilityLists(true);

   Future<List<TypePermitModel?>?> getTypePermitList() async =>
      await viewPermitUsecase.getTypePermitList(true);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await viewPermitUsecase.getInventoryCategoryList(
      );

  Future<List<InventoryCategoryModel?>?> getInventoryIsolationList({
    String? auth,
    int? facilityId,
    bool? isLoading,
    int? categoryId,
  }) async =>
      await viewPermitUsecase.getInventoryIsolationList(
      );

    Future<List<InventoryModel?>?> getInventoryEquipmentNameList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return viewPermitUsecase.getInventoryEquipmentNameList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }
  // Future<void> createCheckList({
  //   bool? isLoading,
  // }) async =>
  //     await viewPermitUsecase.createCheckList(isLoading: isLoading);

  Future<Map<String, dynamic>?> createNewPermit({
     newPermit,
    required bool isLoading,
  }) async {
    return viewPermitUsecase.createNewPermit(
       newPermit: newPermit,
      isLoading: isLoading,
    );
  }

}


