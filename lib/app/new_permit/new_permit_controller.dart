import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/add_job/add_job_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/widgets/create_permit_dialog.dart';
import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/create_permit_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/inventory_detail_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/models/user_access_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cmms/domain/models/equipment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/inventory_category_model.dart';

class NewPermitController extends GetxController {
  NewPermitController(this.permitPresenter, this.jobListPresenter);


  // PreventivePresenter preventivePresenter;


  //   RxBool on = false.obs; // our observable
  // // swap true/false & save it to observable
  // void toggle() => on.value = on.value ? false : true;

   var isToggleOn = false.obs;
   var isToggleOn1 = false.obs;
   var isToggleOn2 = false.obs;
   var isToggleOn3 = false.obs;
   var isToggleOn4 = false.obs;
   var isToggleOn5 = false.obs;
   var isToggleOn6 = false.obs;
   var isToggleOn7 = false.obs;

///Switch toggle
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  ///Checkbox
 RxBool isChecked1 = false.obs; // Create an observable boolean to track the checkbox state
 RxBool isChecked2 = false.obs;
 RxBool isChecked3 = false.obs;
 RxBool isChecked4 = false.obs;
 RxBool isChecked5 = false.obs;
 RxBool isChecked6 = false.obs;
 RxBool isChecked7 = false.obs;

 RxBool isCheckedJSA = false.obs;


  void toggleCheckbox1() {
    isChecked1.value = !isChecked1.value; // Toggle the checkbox state
  }
   void toggleCheckbox2() {
    isChecked2.value = !isChecked2.value; // Toggle the checkbox state
  }
   void toggleCheckbox3() {
    isChecked3.value = !isChecked3.value; // Toggle the checkbox state
  }
   void toggleCheckbox4() {
    isChecked4.value = !isChecked4.value; // Toggle the checkbox state
  }
   void toggleCheckbox5() {
    isChecked5.value = !isChecked5.value; // Toggle the checkbox state
  }
   void toggleCheckbox6() {
    isChecked6.value = !isChecked6.value; // Toggle the checkbox state
  }
   void toggleCheckbox7() {
    isChecked7.value = !isChecked7.value; // Toggle the checkbox state
  }

  void jSAtoggleCheckbox() {
    isCheckedJSA.value = !isCheckedJSA.value; // Toggle the checkbox state
  }

  void _doSomething() {
    // Do something
  }


  int? selectedFacilityId = 0;
  int selectedTypePermitId = 0;
  int? selectedPermitTypeId = 0;
  int selectedJobTYpesId = 0;

  NewPermitPresenter permitPresenter;
  JobListPresenter jobListPresenter;

  // create permit
  Rx<bool> isFormInvalid = false.obs;
  int selectedFacility_id = 0;
  RxList<InventoryModel?> selectedWorkAreaList = <InventoryModel>[].obs;

  String username = '';
  Rx<String> selectedFacility = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<bool> isJobDescriptionInvalid = false.obs;
  Rx<bool> isTitleTextInvalid = false.obs;


  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  Rx<String> selectedStartDate = ''.obs;
  Rx<bool> isStartdate = true.obs;
  Rx<bool> isEnddate = true.obs;

  var startDateTimeCtrlr = TextEditingController();
  var validTillTimeCtrlr = TextEditingController();

  var jobDescriptionCtrlr = TextEditingController();
  var titleTextCtrlr = TextEditingController();


  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  Rx<DateTime> selectedValidTillTime = DateTime.now().obs;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<bool> isBlockSelected = true.obs;
  Rx<String> selectedBlock = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;

  int selectedBlockId = 0;
  RxList<EquipmentModel?> equipmentList = <EquipmentModel>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  int selectedAssignedToId = 0;
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
    int selectedInventoryCategoryId = 0;



  //Equipment Isolation
  RxList<int> selectedEquipmentIsolationIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentIsolationList =
      <InventoryCategoryModel>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentIsolationList =
      <InventoryCategoryModel>[].obs;

  //Equipment Name List
  RxList<InventoryModel?> equipmentNameList = <InventoryModel>[].obs;
  RxList<InventoryModel?> filteredEquipmentNameList = <InventoryModel>[].obs;
  RxList<int> selectedEquipmentNameIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentNameList =
      <InventoryCategoryModel>[].obs;
  String categoryIds = '';
  Rx<int> id = 0.obs;


  ///Employee List
  RxList<EmployeeListModel> employeeList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;
  RxList<EmployeeListModel?> selectedEmployeeNameList =
    <EmployeeListModel>[].obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;
  RxList<EmployeeListModel?> employeeNameList = <EmployeeListModel>[].obs;
  RxList<EmployeeListModel?> filteredEmployeeNameList = <EmployeeListModel>[].obs;

/// Job Type Permit List
  RxList<JobTypeListModel> jobTypeList = <JobTypeListModel>[].obs;
  Rx<bool> isJobTypeListSelected = true.obs;
  Rx<String> selectedJobTypeList = ''.obs;
  RxList<String?> selectedJobTypeDataList = <String>[].obs;
  RxList<int?> selectedJobTypeIdList = <int>[].obs;


  ///SOP Permit List
  RxList<SOPListModel> sopPermitList = <SOPListModel>[].obs;
  Rx<bool> isSopPermitListSelected = true.obs;
  Rx<String> selectedSopPermitList = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;


  ///Safety Measure List
  RxList<SafetyMeasureListModel> safetyMeasureList = <SafetyMeasureListModel>[].obs;
  Rx<bool> isSafetyMeasuretListSelected = true.obs;
  Rx<String> selectedSafetyMeasureList = ''.obs;
  RxList<String?> selectedSafetyMeasureDataList = <String>[].obs;
  RxList<int?> selectedSafetyMeasureIdList = <int>[].obs;
  int selectedSafetyMeasureId = 0;




  ///Permit Issuer
   RxList<EmployeeListModel?> selectedPermitIssuerList =
    <EmployeeListModel>[].obs;
  RxList<int> selectedPermitIssuerIdList = <int>[].obs;
  RxList<EmployeeListModel?> permitIssuerList = <EmployeeListModel>[].obs;
  Rx<bool> isPermitIssuerListSelected = true.obs;
  Rx<String> selectedPermitIssuerLists = ''.obs;
  RxList<String?> selectedPermitIssuerDataList = <String>[].obs;
  int selectedPermitIssuerTypeId = 0;
  int selectedEmployeeTestId = 0;


  ///Permit Approver
   RxList<EmployeeListModel2?> selectedPermitApproverList =
    <EmployeeListModel2>[].obs;
  RxList<int> selectedPermitApproverIdList = <int>[].obs;
  RxList<EmployeeListModel2?> permitApproverList = <EmployeeListModel2>[].obs;
  Rx<bool> isPermitApproverListSelected = true.obs;
  Rx<String> selectedPermitApproverLists = ''.obs;
  RxList<String?> selectedPermitApproverDataList = <String>[].obs;
  int selectedPermitApproverTypeId = 0;









    PaginationController equipmentNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  PaginationController employeeNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  RxList<InventoryDetailModel?>? inventoryDetailList = <InventoryDetailModel?>[].obs;
  InventoryDetailModel? inventoryDetailListModel;
  RxList<String> inventoryDetailListTableColumns = <String>[].obs;
  int ids = 14430;

   PaginationController inventoryDetailPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );




  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Map<dynamic, dynamic> employee_map = {};
  Map<int, dynamic> loto_map = {};






  @override
  void onInit() async {
    //homePresenter.generateToken();
    //  Future.delayed(Duration(seconds: 1), () {
       facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;

      Future.delayed(Duration(seconds: 1), () {
       getBlocksList(facilityId);
      });
    });
    await getInventoryCategoryList();
    await getInventoryIsolationList();
   // await getInventoryEquipmentNameList();
    await getAssignedToList();
    await getFacilityLists();
    await getFacilitiesLists();
    await getTypePermitList();
    await getInventoryDetailList();
    await getEmployeePermitList();
    await getJobTypePermitList();
    await getPermitIssuerList();
    await getPermitApproverList();
    await getSafetyMeasureList();


    super.onInit();
  }

  Future<void> getFacilitiesLists() async {
    facilityList.value = <FacilityModel>[];
    blockList.value = <BlockModel>[];
    final _facilityList = await jobListPresenter.getFacilityList();
    selectedFacilityId = Get.arguments;
    if (_facilityList != null) {
      facilityList.value = _facilityList;

      int facilityIndex =
          facilityList.indexWhere((x) => x?.id == selectedFacilityId);
      if (facilityIndex > -1) {
        selectedFacility.value = facilityList[facilityIndex]?.name ?? '';
        getBlocksList(selectedFacilityId!);
      }
    }
  }

  Future<void> getInventoryDetailList() async {
     inventoryDetailList!.value = <InventoryDetailModel>[];

    final list = await permitPresenter.getInventoryDetailList(
      isLoading: true,
      id: 14430
    );
    if (list != null) {
      // selectedSupplierNameList.clear();
      // supplierNameList.clear();
      Set<String> supplierNameSet = {};
      for(var _inventoryDetailList in list){
        if(_inventoryDetailList?.name != null){
          // inventoryDetailList!.add(_inventoryDetailList?.name ?? "");
          inventoryDetailList!.add(_inventoryDetailList);
        }


      }

      // for (var supplier_name_list in list) {
      //   supplierNameList.add(supplier_name_list);
      // }
    }
    // inventoryDetailList = list;
    inventoryDetailPaginationController = PaginationController(
      rowCount: inventoryDetailList!.length,
      rowsPerPage: 10,
    );
    update(['inventory_detail_list']);
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

   void equipmentNameSelected(_selectedEquipmentNameIds) {
    selectedEquipmentNameIdList.value = <int>[];
    filteredEquipmentNameList.value = <InventoryModel>[];
    for (var _selectedNameId in _selectedEquipmentNameIds) {
      selectedEquipmentNameIdList.add(_selectedNameId);
   InventoryModel? e =   equipmentNameList.firstWhere((element) {

    return element?.id ==_selectedNameId;
    } );
      filteredEquipmentNameList.add(e);
    }
    // print({"selectedEquipmentNameIdList le":selectedEquipmentNameIdList.value.length,"filteredEquipmentNameList":filteredEquipmentNameList.value.length});
  }

   void employeeNameSelected(_selectedEmployeeNameIds) {
    selectedEmployeeNameIdList.value = <int>[];
    filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedEmployeeNameId in _selectedEmployeeNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeeNameId);
   EmployeeListModel? e =   employeeNameList.firstWhere((element) {
    return element?.id ==_selectedEmployeeNameId;
    } );
      filteredEmployeeNameList.add(e);
    }

    employee_map[emp_id] = selectedEmployeeNameIdList;
  }

  void permitIssuerSelected(_selectedEmployeeNameIds) {

    selectedPermitIssuerIdList.value = <int>[];
    // filteredEmployeeNameList.value = <EmployeeListModel>[];
    late int emp_id = 0;
    for (var _selectedPermitIssuerId in _selectedEmployeeNameIds) {
      selectedPermitIssuerIdList.add(_selectedPermitIssuerId);
   EmployeeListModel? e =   permitIssuerList.firstWhere((element) {

    return element?.id ==_selectedPermitIssuerId;
    } );
      // filteredEmployeeNameList.add(e);
    }

    // employee_map[emp_id] = selectedEmployeeNameIdList;
  }



  void equipmentIsolationSelected(_selectedEquipmentIsolationIds) {
    selectedEquipmentIsolationIdList.value = <int>[];
    for (var _selectedIsolationId in _selectedEquipmentIsolationIds) {
      selectedEquipmentIsolationIdList.add(_selectedIsolationId);

    }


    getInventoryEquipmentNameList();
  }

  Future<void> getAssignedToList() async {
    final _assignedToList = await permitPresenter.getAssignedToList();

    if (_assignedToList != null) {
      for (var _assignedTo in _assignedToList) {
        assignedToList.add(_assignedTo);
      }
      update(["assignedToList"]);
    }
  }

  Future<void> getEmployeePermitList() async {
    employeeNameList.value = <EmployeeListModel>[];
    final _employeeNameList = await permitPresenter.getEmployeePermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    if (_employeeNameList != null) {
      for (var employee_list in _employeeNameList) {
        employeeNameList.add(employee_list);
      }
    }
    // supplierNameList = _supplierNameList;
    employeeNamepaginationController = PaginationController(
      rowCount: employeeNameList.length,
      rowsPerPage: 10,
    );
    update(['permit_employee_list']);
  }

   Future<void> getPermitIssuerList() async {
    permitIssuerList.value = <EmployeeListModel>[];
    final _permitIssuerList = await permitPresenter.getPermitIssuerList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    if (_permitIssuerList != null) {
      for (var permit_issuer_list in _permitIssuerList) {
        permitIssuerList.add(permit_issuer_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_issuer_list']);
  }

  Future<void> getPermitApproverList() async {
    permitApproverList.value = <EmployeeListModel2>[];
    final _permitApproverList = await permitPresenter.getPermitApproverList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: 45,
    );
    if (_permitApproverList != null) {
      for (var permit_approver_list in _permitApproverList) {
        permitApproverList.add(permit_approver_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['permit_approver_list']);
  }

  Future<void> getJobTypePermitList() async {
    jobTypeList.value = <JobTypeListModel>[];
    final _jobTypeList = await permitPresenter.getJobTypePermitList(
      isLoading: true,
      // categoryIds: cPategoryIds,
      facility_id: 45,
    );
    if (_jobTypeList != null) {
      for (var jobType_list in _jobTypeList) {
        jobTypeList.add(jobType_list);
      }

    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['job_Type_list']);
  }

  Future<void> getSopPermitList() async {
    sopPermitList.value = <SOPListModel>[];
    final _sopPermitList = await permitPresenter.getSopPermitList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobTYpesId,
      // job_type_id: 36,

    );
    if (_sopPermitList != null) {
      for (var sopPermit_list in _sopPermitList) {
        sopPermitList.add(sopPermit_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['sop_permit_list']);
  }

   Future<void> getSafetyMeasureList() async {
    safetyMeasureList.value = <SafetyMeasureListModel>[];
    final _safetyMeasureList = await permitPresenter.getSafetyMeasureList(
      isLoading: true,
      // categoryIds: categoryIds,
      permit_type_id: 7,
      // job_type_id: 36,

    );
    if (_safetyMeasureList != null) {
      for (var safetyMeasure_list in _safetyMeasureList) {
        safetyMeasureList.add(safetyMeasure_list);
      }
    }
    // supplierNameList = _supplierNameList;
    // employeeNamepaginationController = PaginationController(
    //   rowCount: employeeNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['safety_measure_list']);
  }






  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);

          print('FacilityId:$selectedFacilityId');
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);

          if (selectedFacilityId != 0) {
            isFacilitySelected.value = true;
          }
          selectedFacility.value = value;
          getBlocksList(selectedFacilityId!);
        }
        break;

      case RxList<BlockModel>:
        {
          int blockIndex = blockList.indexWhere((x) => x?.name == value);
          selectedBlockId = blockList[blockIndex]?.id ?? 0;
          if (selectedBlockId > 0) {
            isBlockSelected.value = true;
          }
          selectedBlock.value = value;
          getInventoryCategoryList(facilityId: selectedBlockId.toString());
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
            int equipCatIndex = equipmentCategoryList
                .indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryIdList.add(equipCatIndex);
            // selectedInventoryCategoryId = equipmentCategoryList[equipCatIndex]?.id ?? 0;
            // print('First Category Id:$selectedInventoryCategoryId');
          }
        }
        break;
      case RxList<InventoryCategoryModel>:
        {
          for (var equipIso in selectedEquipmentIsolationList) {
            int equipIsoIndex = selectedEquipmentIsolationList
                .indexWhere((x) => x?.name == equipIso);
            selectedEquipmentIsolationIdList.add(equipIsoIndex);
          }
        }
        break;

      case RxList<EmployeeModel>:
        {
          int assignedToIndex =
              assignedToList.indexWhere((x) => x?.name == value);
          selectedAssignedToId = assignedToList[assignedToIndex]?.id ?? 0;
          if (selectedAssignedToId != 0) {
            isAssignedToSelected.value = true;
          }
          selectedAssignedTo.value = value;
        }
        break;
      case RxList<TypePermitModel>:
        {
          int permitTypeIndex =
              typePermitList.indexWhere((x) => x?.name == value);
          selectedTypePermitId = facilityList[permitTypeIndex]?.id ?? 0;
          selectedPermitTypeId = typePermitList[permitTypeIndex]?.id ?? 0;
          if (selectedTypePermitId != 0) {
            isTypePermitSelected.value = true;
          }
          selectedTypePermit.value = value;
          getBlocksList(selectedTypePermitId);
        }
        break;
         case RxList<EmployeeListModel>:
        {

            int permitIssuerListIndex =
                permitIssuerList.indexWhere((x) => x!.name == value);
            selectedPermitIssuerTypeId = permitIssuerList[permitIssuerListIndex]!.id ?? 0;

        }
        break;
         case RxList<EmployeeListModel2>:
        {

             int permitApproverListIndex =
                permitApproverList.indexWhere((x) => x!.name == value);
            selectedPermitApproverTypeId = permitApproverList[permitApproverListIndex]!.id ?? 0;

        }
        break;
         case RxList<JobTypeListModel>:
        {
            int jobTypeListIndex =
                jobTypeList.indexWhere((x) => x.name == value);
             selectedJobTYpesId = jobTypeList[jobTypeListIndex].id ?? 0;
            getSopPermitList();

          //}
        }
        break;
         case RxList<SOPListModel>:
        {
            int sopPermitListIndex =
                sopPermitList.indexWhere((x) => x.name == value);
            selectedSOPId = sopPermitList[sopPermitListIndex].id ?? 0;

        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    blockList.value = <BlockModel>[];
    final _blockList =
        await permitPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blockList.add(block);
      }
      update(["blockList"]);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await permitPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

   Future<void> getInventoryIsolationList({String? facilityId}) async {
    equipmentIsolationList.value = <InventoryCategoryModel>[];
    final _equipmentIsolationList =
        await permitPresenter.getInventoryIsolationList(
      isLoading: true,
    );
    if (_equipmentIsolationList != null) {
      for (var equimentIsolation in _equipmentIsolationList) {
        equipmentIsolationList.add(equimentIsolation);
      }
    }
  }

   Future<void> getInventoryEquipmentNameList() async {
    equipmentNameList.value = <InventoryModel>[];
    String  categoryIds= selectedEquipmentIsolationIdList.join(', ');
    final _equipmentNameList =
        await permitPresenter.getInventoryEquipmentNameList(
      isLoading: true,
      categoryIds:categoryIds,
      facilityId: facilityId,
    );
    if (_equipmentNameList != null) {
      for (var equipmentName in _equipmentNameList) {
        equipmentNameList.add(equipmentName);
      }

    }
     equipmentNamepaginationController = PaginationController(
      rowCount: equipmentNameList.length,
      rowsPerPage: 10,
    );


  }

  void updateDropdownValue(String value) {
    selectedFacility.value = value;
  }

  Future<void> getFacilityLists() async {
    final _facilityList = await permitPresenter.getFacilityLists();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getTypePermitList() async {
    final _permitTypeList = await permitPresenter.getTypePermitList();

    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }
  }

  void checkForm() {
    if (selectedFacility.value == '') {
      isFacilitySelected.value = false;
    }
    if (selectedBlock.value == '') {
      isBlockSelected.value = false;
    }
    if (selectedTypeOfPermit.value == '') {
      isTypePermit.value = false;
    }
    if (startDateTimeCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'Start date Field cannot be empty');
    }
    if (validTillTimeCtrlr.text == '') {
      Fluttertoast.showToast(msg: 'End date Field cannot be empty');
    }
    if (selectedTypePermit.value == '') {
      isTypePermitSelected.value = false;
    }
    if (jobDescriptionCtrlr.text.trim().length < 3) {
      isJobDescriptionInvalid.value = true;
    }
    if (titleTextCtrlr.text.trim().length < 3) {
      isTitleTextInvalid.value = true;
    }
    if (isAssignedToSelected.value == false ||
        isFacilitySelected.value == false ||
        isBlockSelected.value == false ||
        isJobDescriptionInvalid == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  void createNewPermit() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }

      String _description = htmlEscape.convert(jobDescriptionCtrlr.text.trim());
      String _title = htmlEscape.convert(titleTextCtrlr.text.trim());
      String _startDate = htmlEscape.convert(startDateTimeCtrlr.text.trim());
       List<Employeelist> employee_map_list = [];
      //UserId
      int userId = varUserAccessModel.value.user_id ?? 0;

    filteredEmployeeNameList.forEach((e) {
      employee_map_list.add(Employeelist(
          employeeId: e?.id, responsibility: e?.name));
    });



    late List<LotoList> loto_map_list = [];

    filteredEquipmentNameList.forEach((e) {
      loto_map_list.add(LotoList(
          Loto_id: e?.id, Loto_Key: e?.name));
    });

    late List<Safetyquestionlist> safety_measure_map_list = [];

    safetyMeasureList.forEach((e) {
      safety_measure_map_list.add(Safetyquestionlist(
          safetyMeasureId: e.id, safetyMeasureValue: e.name));
    });

      //  List<Employeelist> employee_list= <Employeelist>[];
      // List<Safetyquestionlist> safety_question_list = <Safetyquestionlist>[];
      // List<LotoList> loto_list = <LotoList>[];

      // for (var _selectedWorkArea in selectedWorkAreaList) {
      //   var json = '{"asset_id": ${_selectedWorkArea?.id},'
      //       '"category_ids": ${_selectedWorkArea?.categoryId}}';

      //   // CreatePermitModel _employeeList = addCreatePermitModelFromJson(json);
      //   // employee_list.add(_employeeList as Employeelist);
      //   // CreatePermitModel _safetyQuestionList = addCreatePermitModelFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList as Safetyquestionlist);
      //   // CreatePermitModel _lotoList = addCreatePermitModelFromJson(json);
      //   // loto_list.add(_lotoList as LotoList);

      //   // SafetyQuestionList _safetyQuestionList = addSafetyQuestionListFromJson(json);
      //   // safety_question_list.add(_safetyQuestionList);
      // }

      CreatePermitModel createPermitModel = CreatePermitModel(
        facility_id: facilityId,
        blockId: selectedBlockId,
        title: _title,
        description: _description,
        approver_id: selectedPermitApproverTypeId,
        category_ids: selectedEquipmentCategoryIdList,
        block_ids: selectedEmployeeNameIdList,
        employee_list: employee_map_list,
        start_datetime: startDateTimeCtrlr.text,
        end_datetime: validTillTimeCtrlr.text,
        is_isolation_required: isToggleOn.value,
        isolated_category_ids: selectedEquipmentIsolationIdList,
        issuer_id: selectedPermitIssuerTypeId,
        lotoId: selectedEquipmentCategoryIdList.first,
        safety_question_list: safety_measure_map_list,
        sop_type_id: selectedSOPId,
        typeId: selectedPermitTypeId, ///Permit Type Id
        user_id: userId,
        work_type_id: selectedJobTYpesId,  ////Job type Id
        Loto_list: loto_map_list,
      );
      var jobJsonString = createPermitModel.toJson();
      Map<String, dynamic>? responseNewPermitCreated =
          await permitPresenter.createNewPermit(
        newPermit: jobJsonString,
        isLoading: true,
      );
      if (responseNewPermitCreated != null) {
        //  CreateNewPermitDialog();
        showAlertDialog();

      }
    }
  }

  static void showAlertDialog({
    int? facility_id,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(CreateNewPermitDialog());
  }

  //  void createCheckList() async {
  //   {
  //     await permitPresenter.createCheckList(
  //       isLoading: true,
  //     );
  //   }
  // }

  // void switchFacility(String? facilityName) {
  //   facilityId =
  //       facilityList.indexWhere((facility) => facility?.name == facilityName);
  //   getJobList(facilityId, userId);
  // }
  //  void onValueChanged(dynamic list, dynamic value) {

  //         int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
  //         selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
  //         if (selectedFacilityId != 0) {
  //           isFacilitySelected.value = true;
  //         }
  //         selectedFacility.value = value;
  //       }
  Future<void> createNewPermits() async {
    Get.toNamed(
      Routes.newPermit,
    );
  }
}
