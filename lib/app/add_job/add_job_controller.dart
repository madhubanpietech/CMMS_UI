import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/add_job_model.dart';
import '../../domain/models/employee_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/tools_model.dart';
import '../home/home_presenter.dart';
import '../job_list/job_list_presenter.dart';
import 'add_job_presenter.dart';

class AddJobController extends GetxController {
  ///
  AddJobController(
      this.addJobPresenter, this.jobListPresenter, this.homePresenter);
  AddJobPresenter addJobPresenter;
  HomePresenter homePresenter;
  JobListPresenter jobListPresenter;

  ///
  RxList<JobModel?>? jobList = <JobModel?>[].obs;

  //
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int selectedFacilityId = 0;
  //
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isBlockSelected = false.obs;
  int selectedBlockId = 0;
  //
  Rx<String> selectedEquipment = ''.obs;
  Rx<bool> isEquipmentSelected = false.obs;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  RxList<EquipmentModel?> selectedEquipmentList = <EquipmentModel>[].obs;
  RxList<int?> selectedEquipmentIdList = <int>[].obs;
  //
  Rx<String> selectedWorkArea = ''.obs;
  Rx<bool> isWorkAreaSelected = false.obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  //
  Rx<String> selectedEquipmentCategory = ''.obs;
  Rx<bool> isEquipmentCategorySelected = false.obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  //
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<String> selectedAssignedTo = ''.obs;
  Rx<bool> isAssignedToSelected = false.obs;
  int selectedAssignedToId = 0;
  //
  Rx<String> selectedToolRequiredToWorkType = ''.obs;
  Rx<bool> isToolRequiredToWorkTypeSelected = false.obs;
  RxList<ToolsModel?>? toolsRequiredToWorkTypeList = <ToolsModel>[].obs;
  RxList<String?> selectedtoolsRequiredToWorkTypeList = <String>[].obs;
  RxList<int?> selectedtoolsRequiredToWorkTypeIdList = <int>[].obs;

  ///
  int selectedPermitId = 0;
  int facilityId = 45;
  List<int> categoryIds = [];
  var breakdownTime;
  var jobDescriptionCtrlr = TextEditingController();
  var jobTitleCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    await homePresenter.generateToken();
    await getFacilityList();
    await getBlocksList(facilityId);
    await getAssignedToList();
    //await getEquipmentList(facilityId: facilityId.toString());
    await getInventoryCategoryList(facilityId.toString());

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await jobListPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      if (facilityList.isNotEmpty) {
        selectedFacility.value = facilityList[0]?.name ?? '';
      }
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    final _blockList =
        await addJobPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["jobList"]);
      if (blockList.isNotEmpty) {
        selectedBlock.value = blockList[0]?.name ?? '';
      }
    }
  }

  Future<void> getAssignedToList() async {
    final _assignedToList =
        await addJobPresenter.getAssignedToList(facilityId: facilityId);

    if (_assignedToList != null) {
      for (var block in _assignedToList) {
        assignedToList.add(block);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getEquipmentList({
    required String facilityId,
  }) async {
    final list = await homePresenter.getEquipmentList(
      isLoading: true,
      facilityId: facilityId,
    );
    equipmentList.value = list;
    selectedEquipment.value = equipmentList[0]?.name ?? '';
  }

  Future<void> getToolsRequiredToWorkTypeList() async {
    final list = await addJobPresenter.getToolsRequiredToWorkTypeList(
      isLoading: true,
    );
    toolsRequiredToWorkTypeList?.value = list ?? [];
    update(['toolsRequiredToWorkTypeList']);
    selectedToolRequiredToWorkType.value =
        toolsRequiredToWorkTypeList?[0]?.name ?? '';
  }

  Future<void> getInventoryCategoryList(String? facilityId) async {
    final _equipmentCategoryList =
        await addJobPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
      // update(['equipmentCategorylist']);
      // selectedEquipmentCategory.value = equipmentCategoryList[0]?.name ?? '';
    }
  }

  Future<void> getInventoryList({
    required int facilityId,
    //required List<int> categoryIds,
  }) async {
    workAreaList.value = [];
    categoryIds = selectedEquipmentCategoryIdList.value;
    String lststrCategoryIds = categoryIds.join(', ').toString();
    final _workAreaList = await homePresenter.getInventoryList(
      facilityId: facilityId,
      categoryIds: lststrCategoryIds,
      isLoading: true,
    );

    for (var workArea in _workAreaList) {
      var _workArea = InventoryModel(
        id: workArea.id,
        name: workArea.name,
        description: workArea.description,
        categoryName: workArea.categoryName,
        blockName: workArea.blockName,
        parentName: workArea.parentName,
        ownerName: workArea.ownerName,
        operatorName: workArea.operatorName,
        status: workArea.status,
      );
      workAreaList.add(_workArea);
    }
    update(["workAreaList"]);
    //selectedWorkArea.value = workAreaList[0]?.name ?? '';
  }

  Future<void> saveJob() async {
    {
      int facilityIndex = facilityList.value
          .indexWhere((x) => x?.name == selectedFacility.value);
      int selectedFacilityId = blockList[facilityIndex]?.id ?? 0;
      int _facilityId = selectedFacilityId;
      int _blockId = selectedBlockId;
      int _permitId = selectedPermitId;
      String _title = jobTitleCtrlr.text.trim();
      String _description = jobDescriptionCtrlr.text.trim();
      List<AssetsId> assetIds = [];
      int _assignedToId = selectedAssignedToId;
      for (var _selectedEquipment in selectedEquipmentList) {
        var selectedAssetIds = [];
        var json = {
          "assetId": _selectedEquipment?.id,
          "categoryIds": _selectedEquipment?.categoryId,
        };
        //assetIds.add();
      }

      AddJobModel addJobModel = AddJobModel(
        facilityId: _facilityId,
        blockId: _blockId,
        permitId: _permitId,
        assignedId: 135,
        title: _title,
        description: _description,
        status: 2,
        createdBy: "",
        assetsIds: assetIds,
        workTypeIds: selectedWorkAreaIdList,
      );
      await addJobPresenter.saveJob(
        job: addJobModel,
        isLoading: true,
      );
    }
  }

  void valueChanged(list, value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          int selectedFacilityId = blockList[facilityIndex]?.id ?? 0;
          print(selectedFacilityId);
          getBlocksList(selectedFacilityId);
        }
        break;

      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          int selectedBlockId = blockList[blockIndex]?.id ?? 0;
          print(selectedBlockId);
        }
        break;
      case RxList<EquipmentModel>:
        {
          int equipmentIndex =
              equipmentList.indexWhere((x) => x?.name == value);
          int selectedEquipmentId = equipmentList[equipmentIndex]?.id ?? 0;
          print(selectedEquipmentId);
        }
        break;
      case RxList<InventoryModel>:
        {
          for (var workAreaName in selectedWorkAreaNameList) {
            int workAreaIndex =
                workAreaList.indexWhere((x) => x?.name == workAreaName);
            selectedWorkAreaIdList.add(workAreaIndex);
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipCat in selectedEquipmentCategoryList) {
            int equipCatIndex = selectedEquipmentCategoryList
                .indexWhere((x) => x?.name == equipCat);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          int selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          print(selectedAssignedToId);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void equipmentCategoriesSelected(selectedEquipmentCategories) {
    selectedEquipmentCategoryIdList.value = [];
    for (var _selectedCategory in selectedEquipmentCategories) {
      selectedEquipmentCategoryIdList.add(_selectedCategory.id);
    }
    getInventoryList(facilityId: facilityId);
  }

  void workAreasSelected(selectedWorkAreas) {
    selectedWorkAreaIdList.value = [];
    for (var _selectedWorkArea in selectedWorkAreas) {
      selectedWorkAreaIdList.add(_selectedWorkArea.id);
    }
  }

  ///
}
