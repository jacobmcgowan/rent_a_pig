/// Provides access to the list of jobs.
class JobsService {
  static List<String> _jobs = [
    'Bacon',
    'Truffle Hunting',
    'Tea Party',
    'Therapy',
  ];


  /// Gets the list of jobs.
  static List<String> getJobs() {
    return _jobs;
  }
}