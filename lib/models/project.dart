class Project {
  const Project({
    required this.id,
    required this.assetImagePath,
    required this.name,
    required this.tags,
    required this.dateText,
  });

  final String id;
  final String? assetImagePath;
  final String name;
  final List<String> tags;
  final String? dateText;
}
