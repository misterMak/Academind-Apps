import 'package:flutter/material.dart';
import 'package:netninja_app1/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

List<WorldTime> locations = [
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
];

Future<bool> _onWillPop() async {
  return true;
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onWillPop();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text('Choose Location Screen'),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Card(
                    child: ListTile(
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/flags/${locations[index].flag}'),
                      ),
                      onTap: () async {
                        WorldTime instance = locations[index];
                        await instance.getTime();
                        Navigator.pop(context, instance.data);
                      },
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
