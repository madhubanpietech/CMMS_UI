import 'package:cmms/app/facility_type_list/facility_type_list_controller.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_presenter.dart';
import 'package:cmms/domain/usecases/facility_type_list_usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/home_usecase.dart';
import '../home/home_controller.dart';
import '../home/home_presenter.dart';

class FacilityTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FacilityTypeListController(
        Get.put(
          FacilityTypeListPresenter(
            FacilityTypeListUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
