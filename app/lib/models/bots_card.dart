class BotViewModel {
  final String name;
  final String status;
  final String lastRun;
  final String nextRun;
  final int runTimes;
  final int runHours;
  final String path;
  final String runDays;

  BotViewModel(
      {required this.name,
      required this.status,
      required this.lastRun,
      required this.nextRun,
      required this.runTimes,
      required this.runDays,
      required this.path,
      required this.runHours});
}
