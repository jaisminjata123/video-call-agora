import 'package:http/http.dart' as http;
import 'package:agora_flutter_quickstart/src/utils/settings.dart';
import 'dart:convert';
class Handler
{
  Future<bool> sendTokenRequest(String userID, String channelName) async
  {
    var queryParams = {
      'user_id' : userID,
      'channel_name' : channelName
    };
    //var url ='http://ec2-65-1-238-132.ap-south-1.compute.amazonaws.com/api/agora_token_api';
    var url = 'https://aaushadh.com/api/agora_token_api/';
    var uri = Uri.https('aaushadh.com','/api/agora_token_api', queryParams);
    print('URI -> '+uri.toString());
    var response = await http.get(uri);

    if(response.statusCode == 200)
    {
      var data = json.decode(response.body);
      print('OK ->'+response.body.toString());
      String token = data['token'];
      print('Token -> '+data['token']);
      if(token!=null)
      {
        Set().Token=token;

        return true;
      }
      else
      {
        return false;
      }

    }
    else
    {
      print('Failed');
      return false;
    }

  }


}