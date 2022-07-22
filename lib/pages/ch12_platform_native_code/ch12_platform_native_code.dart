import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ch12PlatformNativeCode extends StatefulWidget {
  const Ch12PlatformNativeCode({Key? key}) : super(key: key);
  static const String nameRoute = "/ch12_platform_native_code";

  @override
  State<Ch12PlatformNativeCode> createState() => _Ch12PlatformNativeCodeState();
}

class _Ch12PlatformNativeCodeState extends State<Ch12PlatformNativeCode> {
  static const _methodChannel =
      MethodChannel('platformchannel.usseiin.com/deviceinfo');
  late String _deviceInfo = "";

  void _getDeviceInfo() async {
    String deviceInfo;
    try {
      deviceInfo = await _methodChannel.invokeMethod("getDeviceInfo");
    } on PlatformException catch (e) {
      deviceInfo = "Failed to get device Info: ${e.message}";
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Native Code"),
      ),
      body: SafeArea(
        child: ListTile(
          title: const Text(
            'Device info:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _deviceInfo,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
