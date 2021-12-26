import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class choose_location extends StatefulWidget {
  const choose_location({Key? key}) : super(key: key);

  @override
  _choose_locationState createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
 
 List<WorldTime> locations = [
   WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
   WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
   WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
   WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'korea.png'),
 ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home
    Navigator.pop(context, {
       'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/${locations[index].flag}'),
              ),
            ),
          )
        },
      ),
    );
  }
}
