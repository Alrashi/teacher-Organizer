class Student {
  final String name;

  int? id;
  String? lastHomeWork;
  String? nextClassStartPoint;
  int numberOfClasses;

  Student({
    this.id,
    required this.name,
    this.lastHomeWork,
    this.nextClassStartPoint,
    this.numberOfClasses = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastHomeWork': lastHomeWork,
      'nextClassStartPoint': nextClassStartPoint,
      'numberOfClasses': numberOfClasses,
    };
  }
}
