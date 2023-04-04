import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN = 'ACCESS_TOKEN';
const REFRESH_TOKEN = 'REFRESH_TOKEN';
const storage = FlutterSecureStorage();
// localhost
const emulatorIp = '10.0.2.2:56231';
const simulatorIp = '127.0.0.1:56231';
final ip = Platform.isIOS ? simulatorIp : emulatorIp;
