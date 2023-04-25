// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const jobList = _Paths.jobList;
  static const jobCard = _Paths.jobCardDetails;
  static const jobDetails = _Paths.jobDetails;
  static const addJob = _Paths.addJob;
  static const editJob = _Paths.editJob;
  static const facility = _Paths.facility;
  static const login = _Paths.login;
  static const preventive = _Paths.preventive;
  static const createCheckList = _Paths.createCheckList;
  static const preventiveList = _Paths.preventiveList;
  static const preventiveCheckPoint = _Paths.preventiveCheckPoint;
  static const breakdown = _Paths.breakdown;
  static const newPermit = _Paths.newPermit;
  static const newPermitList = _Paths.newPermitList;
  static const warrantyClaimList = _Paths.warrantyClaimList;
  static const preventiveMaintenanceMapping =
      _Paths.preventiveMaintenanceMapping;
  static const calibrationList = _Paths.calibrationList;
  static const CalibrationHistory = _Paths.calibrationHistory;
  static const viewWarrantyClaim = _Paths.viewWarrantyClaim;
  static const calibrationDetail = _Paths.calibrationDetail;
  static const pmSchedule = _Paths.pmSchedule;
  static const pmTask = _Paths.pmTask;
  static const pmExecution = _Paths.pmExecution;
  static const pmExecutionView = _Paths.pmExecutionView;
  static const newWarrantyClaimList = _Paths.newWarrantyClaimList;
  static const warrantyClaimListWeb = _Paths.warrantyClaimListWeb;

  // static const editPermitWebScreen = _Paths.editPermitWebScreen;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-screen';
  static const jobList = '/job-list-screen';
  static const jobDetails = '/job-details-screen';
  static const addJob = '/add-job-screen';
  static const editJob = '/edit-job-screen';
  static const facility = '/facility';
  static const jobCardDetails = '/job-card-details';
  static const login = '/login-screen';
  static const preventive = '/preventive-screen';
  static const breakdown = '/breakdown-maintenance';
  static const newPermit = '/new-permit';
  static const createCheckList = '/create_preventive_checklist-screen';
  static const preventiveList = '/preventive-list-screen';
  static const preventiveCheckPoint = '/preventive-check-point';
  static const newPermitList = '/new-permit-list';
  static const warrantyClaimList = '/warranty-claim-list';
  static const warrantyClaimListWeb = '/warranty-claim-list-web';

  static const preventiveMaintenanceMapping = '/pm-mapping-screen';
  static const calibrationList = '/calibration-list-screen';
  static const calibrationHistory = '/calibration-history-screen';
  static const viewWarrantyClaim = '/view-warranty-claim';
  static const newWarrantyClaimList = '/new-warranty-claim-list';
  static const calibrationDetail = '/calibration-detail';
  static const pmSchedule = '/pm-schedule-screen';
  static const pmTask = '/pm-task-screen';
  static const pmExecution = '/pm-execution-screen';
  static const pmExecutionView = '/pm-execution-view-screen';
  // static const editPermitWebScreen = '/edit-permit-web-screen';
}
