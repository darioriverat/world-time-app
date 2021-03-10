import 'package:flutter/cupertino.dart';
import 'package:world_time/services/flag.dart';
import 'package:world_time/services/world_time.dart';

class Location {
  String flag;
  String name;
  String zone;

  Location({ this.name, this.flag , this.zone });

  NetworkImage getFlag() {
    return NetworkImage(Flag.getUrl(flag));
  }

  Future<Map> toMap() async {
    WorldTime worldTime = new WorldTime();
    await worldTime.setTime(name, zone);

    return {
      'location': name,
      'time': worldTime.time,
      'isDayTime' : worldTime.isDayTime
    };
  }
}
