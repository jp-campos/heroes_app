String? mapImage(Map<String, dynamic>? json) {
  return json != null ? '${json['path']}.${json['extension']}' : null;
}
