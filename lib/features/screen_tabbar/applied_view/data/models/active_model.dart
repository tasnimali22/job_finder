class ActiveModel {
  final String title;
  final String company;
  final String location;
  final String logoUrl;
  final String jobType; // Fulltime
  final String workType; // Remote
  final String postedDate;
  final bool isApplied; // هل تم التقديم؟
  final int currentStep; // 1, 2, or 3

  ActiveModel({
    required this.title,
    required this.company,
    required this.location,
    required this.logoUrl,
    required this.jobType,
    required this.workType,
    required this.postedDate,
    this.isApplied = false,
    this.currentStep = 1,
  });
}
