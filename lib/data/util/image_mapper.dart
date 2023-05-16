String? mapImage(Map<String, dynamic>? json) {
  String? path = json?['path'];
  path = path?.replaceFirst('http', 'https');
  return json != null ? '$path.${json['extension']}' : null;
}
