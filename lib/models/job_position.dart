class JobPosition {
  final String id;
  final String title;
  final String salary;
  final String location;
  final String deadline;
  final String description;
  final List<String> requirements;
  final List<String> benefits;

  const JobPosition({
    required this.id,
    required this.title,
    this.salary = 'Thỏa thuận',
    required this.location,
    required this.deadline,
    this.description = '',
    this.requirements = const [],
    this.benefits = const [],
  });
}
