class Project {
  const Project({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.tags,
    required this.start,
    required this.end,
  });

  final String id;
  final String imagePath;
  final String name;
  final List<String> tags;
  final String? start;
  final String? end;
}
