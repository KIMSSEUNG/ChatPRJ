import 'dart:io';

class FileHandler {
  // 싱글톤 인스턴스
  static final FileHandler _instance = FileHandler._internal();
  static FileHandler get instance => _instance;

  // 파일 경로
  late final String _saveDataPath;
  late File _file;

  // 내부 생성자 (private constructor)
  FileHandler._internal() {
    final directory = Directory.systemTemp;
    _saveDataPath = '${directory.path}/app_data.txt';
    _file = File(_saveDataPath);
  }

  // 데이터 저장 (동기 방식)
  void saveData(String key, String value) {
    try {
      // 파일이 존재하지 않을 경우 생성
      if(!_file.existsSync()){
        _file.createSync(recursive: true);
      }

      List<String> lines = _file.readAsLinesSync();
      bool keyExists = false;

      for (int i = 0; i < lines.length; i++) {
        List<String> parts = lines[i].split(':');
        if (parts.length == 2 && parts[0] == key) {
          lines[i] = '$key:$value';  // 기존 키값을 업데이트
          keyExists = true;
          break;
        }
      }

      // 새로운 키값 추가
      if (!keyExists) {
        lines.add('$key:$value');
      }
      // 파일에 업데이트된 내용을 저장 (줄바꿈 유지)
      _file.writeAsStringSync(lines.join('\n'));
      print('Data saved successfully to $_saveDataPath');
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  // 데이터 불러오기 (동기 방식)
  String? getValue(String key) {
    try {
      if (!_file.existsSync()) return null;
      List<String> lines = _file.readAsLinesSync();
      for (var line in lines) {
        List<String> parts = line.split(':');
        if (parts.length == 2 && parts[0] == key) {
          return parts[1]; // 키와 일치하는 값 반환
        }
      }
    } catch (e) {
      print('Error reading data: $e');
    }
    return null; // 키가 없을 경우 null 반환
  }

}
