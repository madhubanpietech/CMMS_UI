class UpdatePmExecutionMdel {
  UpdatePmExecutionMdel({
    required this.schedule_id,
    required this.add_observations,
  });

  int schedule_id;

  List<AddObservations> add_observations;

  factory UpdatePmExecutionMdel.fromJson(Map<String, dynamic> json) =>
      UpdatePmExecutionMdel(
        schedule_id: json["schedule_id"],
        add_observations: List<AddObservations>.from(
            json["add_observations"].map((x) => AddObservations.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedule_id": schedule_id,
        "add_observations":
            List<dynamic>.from(add_observations.map((x) => x.toJson())),
      };
}

class AddObservations {
  AddObservations({
    required this.execution_id,
    required this.observation,
    required this.job_create,
    required this.pm_files,
  });

  int execution_id;
  String observation;
  int job_create;
  List<PmFiles> pm_files;

  factory AddObservations.fromJson(Map<String, dynamic> json) =>
      AddObservations(
        execution_id: json["execution_id"],
        observation: json["observation"],
        job_create: json["job_create"],
        pm_files: List<PmFiles>.from(
            json["pm_files"].map((x) => PmFiles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "execution_id": execution_id,
        "observation": observation,
        "job_create": job_create,
        "pm_files": List<dynamic>.from(pm_files.map((x) => x.toJson())),
      };
}

class PmFiles {
  PmFiles({
    required this.file_id,
    required this.file_desc,
    required this.pm_event,
  });
  int file_id;
  String file_desc;
  int pm_event;

  factory PmFiles.fromJson(Map<String, dynamic> json) => PmFiles(
        file_id: json["file_id"],
        file_desc: json["file_desc"],
        pm_event: json["pm_event"],
      );

  Map<String, dynamic> toJson() => {
        "file_id": file_id,
        "file_desc": file_desc,
        "pm_event": pm_event,
      };
}
