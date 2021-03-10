import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String zone;

  Future<String> setTime(String location, String zone) async {
    this.location = location;
    this.zone = zone;

    Response response = await get('http://worldtimeapi.org/api/timezone/$zone');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    datetime = datetime.replaceFirst(data['utc_offset'], '+00:00');

    DateTime now = DateTime.parse(datetime);

    return time = DateFormat.jm().format(now);
  }
}
