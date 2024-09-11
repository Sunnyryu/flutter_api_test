import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
 
void main() async {
    WidgetsFlutterBinding.ensureInitialized();  // 1번코드
  await dotenv.load(fileName: ".env");    // 2번코드
  runApp(
    const MaterialApp(
      home: SunnyTestWidget(),
    ),
  );
}
 
// API 요청 결과를 반영할 상태 변경 위젯
class SunnyTestWidget extends StatefulWidget {
  const SunnyTestWidget({super.key});
 
  @override
  State<SunnyTestWidget> createState() => _SunnyTestWidgetState();
}
 
class _SunnyTestWidgetState extends State<SunnyTestWidget> {
  // dio 패키지를 통해 API 통신 결과를 저장할 변수
  dynamic resultJson = '';
  String resultValue = '';




 

  @override
  Widget build(BuildContext context) {
  String ip = dotenv.get("test");
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              // dio 패키지를 통해 API 통신 수행 버튼
              ElevatedButton(
                onPressed: () async {
                  // API 요청
                  final response = await Dio().get('http://$ip/' );
                  print(000);
                  print(response);
                  print(11);
                  // API 응답 결과 반영을 위한 상태 변경
                  setState(() {
                    // resultJson: 전체 값 호출
                    resultJson = response.data;
 
                    // resultValue : 'result' 키의 값 호출
                    resultValue = response.data['result'];
                  });
                },
                child: const Text('dio'),
              ),
              const Divider(),
              Text('응답 결과 : Json 타입\n$resultJson'),
              const Divider(),
              Text('특정 키의 값 호출\n$resultValue'),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}