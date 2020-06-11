import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'dart:convert';

class WorldTime{
  
  String location; // location name for UI
  String time; // time in the location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint
  bool isDaytime;
  int timeDifference;
  Map data = {};

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    http.Response response = await http.get('http://worldtimeapi.org/api/timezone/$url');
    data = jsonDecode(response.body);
    
    // get properties from data
    String datetime = data['datetime'].substring(0,19);
		DateTime now = DateTime.parse(datetime);
    timeDifference = now.difference(DateTime.now()).inHours;
    isDaytime = (now.hour > 6 && now.hour < 20);

    // set time property
    time = intl.DateFormat.jm().format(now);

    data = {
      'location':	location, 
      'flag':	flag,
      'time': time,
      'isDaytime': isDaytime,
      'timeDifference': timeDifference,
    };
  }

}


// countDownTimer() async {
//  int timerCount;
//  for (int x = 5; x > 0; x--) {
//    await Future.delayed(Duration(seconds: 1)).then((_) {
//      setState(() {
//        timerCount -= 1;
//     });
//   });
//  }
// }
