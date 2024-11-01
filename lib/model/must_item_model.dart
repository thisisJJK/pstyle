class MustItemModel {
  int? id; // Primary Key
  String title; // 할 일 제목
  bool isDone; // 완료 여부
  DateTime deadline; // 데드라인 날짜 및 시간

  // 선택 사항

  bool? isImportant; // 중요 여부 (선택 사항)
  bool? isDaily; // 매일 여부 (선택 사항)
  int? estimatedTime; // 예상 소요 시간 (분 단위, 선택 사항)

  MustItemModel({
    this.id,
    required this.title,
    this.isDone = false,
    required this.deadline,
    this.isImportant,
    this.isDaily,
    this.estimatedTime,
  });

  // 객체를 Map 형식으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
      'deadline': deadline.toIso8601String(),
      'isImportant': isImportant == true ? 1 : 0,
      'isDaily': isDaily == true ? 1 : 0,
      'estimatedTime': estimatedTime,
    };
  }

  // Map을 객체로 변환
  factory MustItemModel.fromMap(Map<String, dynamic> map) {
    return MustItemModel(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
      deadline: DateTime.parse(map['deadline']),
      isImportant: map['isImportant'] == 1,
      isDaily: map['isDaily'] == 1,
      estimatedTime: map['estimatedTime'],
    );
  }
  MustItemModel copyWith({
    int? id,
    String? title,
    bool? isDone,
    DateTime? deadline,
    bool? isImportant,
    bool? isDaily,
    int? estimatedTime,
  }) {
    return MustItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      deadline: deadline ?? this.deadline,
      isImportant: isImportant ?? this.isImportant,
      isDaily: isDaily ?? this.isDaily,
      estimatedTime: estimatedTime ?? this.estimatedTime,
    );
  }
}
