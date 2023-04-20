import 'dart:async';

import 'package:cmms/app/pm_schedule/pm_schedule_presenter.dart';
import 'package:cmms/domain/models/set_pm_schedule_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/inventory_category_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/save_pm_schedule_model.dart';
import '../home/home_controller.dart';

class PmScheduleController extends GetxController {
  PmScheduleController(
    this.pmSchedulePresenter,
  );
  PmSchedulePresenter pmSchedulePresenter;
  final HomeController homecontroller = Get.find();

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  int selectedEquipmentId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<GetPmScheduleListModel?>? getPmScheduleList =
      <GetPmScheduleListModel?>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  GetPmScheduleListModel? getPmScheduleListModel;
  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  RxList<String> frequencyListName = <String>[].obs;
  var dayCtrlr = TextEditingController();
  var weeklyCtrlr = TextEditingController();
  @override
  void onInit() async {
    getInventoryCategoryList();
    getFrequencyList();

    Future.delayed(Duration(seconds: 1), () {
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
        getPMScheduleData(facilityId, selectedEquipmentId, true);
      });
    });
    super.onInit();
  }

  Future<void> getFrequencyList() async {
    final list = await pmSchedulePresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyListName.add(_frequencyList!.name ?? '');
      }
      print({"frequencyListName", frequencyListName});
    }
  }

  Future<void> getInventoryCategoryList() async {
    final list = await pmSchedulePresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
      selectedequipment.value = equipmentCategoryList[0]?.name.toString() ?? '';
      selectedEquipmentId = equipmentCategoryList[0]?.id ?? 0;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
          getPMScheduleData(facilityId, selectedEquipmentId, true);
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> getPMScheduleData(
      int facilityId, int selectedEquipmentId, bool isLoading) async {
    getPmScheduleList?.value = <GetPmScheduleListModel>[];
    final _getPmScheduleList = await pmSchedulePresenter.getPMScheduleData(
        facilityId: facilityId,
        selectedEquipmentId: selectedEquipmentId,
        isLoading: isLoading);

    if (_getPmScheduleList != null) {
      getPmScheduleList!.value = _getPmScheduleList;
      paginationController = PaginationController(
        rowCount: getPmScheduleList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (getPmScheduleList != null && getPmScheduleList!.isNotEmpty) {
        getPmScheduleListModel = getPmScheduleList![0];
        var getPmScheduleListModelJson = getPmScheduleListModel!.toJson();
        preventiveCheckListTableColumns.value = <String>[];
        for (var key in getPmScheduleListModelJson.keys.toList()) {
          preventiveCheckListTableColumns.add(key);
        }
      }
    }
  }

  void savePmSchedule() async {
    SavePmScheduleModel savePmScheduleModel =
        SavePmScheduleModel(facilityId: facilityId, asset_schedules: []);
    var pmScheduleJsonString = savePmScheduleModel.toJson();
    Map<String, dynamic>? responsePmScheduleCreated =
        await pmSchedulePresenter.savePmSchedule(
      pmScheduleJsonString: pmScheduleJsonString,
      isLoading: true,
    );
  }
}
