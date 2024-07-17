public class Utils {
  public static getOrgId() {
    return UserInfo.getOrganizationId();
  }

  public static Boolean isJobFinished(String jobId) {
    if (String.isBlank(jobId)) {
      return true;
    }
    List<AsyncApexJob> apexJob = [
      SELECT Status
      FROM AsyncApexJob
      WHERE Id = :jobId
    ];
    Set<String> finishedStatuses = new Set<String>{
      'Aborted',
      'Completed',
      'Failed'
    };
    return apexJob.isEmpty() || finishedStatuses.contains(apexJob[0].Status);
  }
}
