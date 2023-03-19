import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

String buildHash({
  required String privateKey,
  required String publicKey,
  int? timeStamp,
}) {
  timeStamp ??= DateTime.now().millisecondsSinceEpoch;
  final input = '$timeStamp$privateKey$publicKey';
  return crypto.md5.convert(utf8.encode(input)).toString();
}
