
import 'package:TheStafferEmployee/Network_Constant/NetworkConstant.dart';
import 'package:http/http.dart'as h;

class ProfileNetworkCall{

  static Future <h.Response> profileData(String token)async{
   var request = h.Request('GET', Uri.parse(NetworkConstants.BASE_URL+NetworkConstants.PROFILE));
   
request.headers.addAll({
    'Authorization': 'Bearer $token',
});

h.StreamedResponse response = await request.send();
var a =await h.Response.fromStream(response);
return a; 
  } 


  static Future <h.Response> changePassword(String token,
   { 
     required String currentpassword,
     required String newpassword,
     required String confirmpassword,}
     )async{
   var request = h.Request('GET', Uri.parse(NetworkConstants.BASE_URL+NetworkConstants.CHANGEPASSWORD));
   request.bodyFields ={
  'currentpassword':currentpassword,
  'newpassword' : newpassword, 
  'confirmpassword' : confirmpassword,
};
request.headers.addAll({
    'Authorization': 'Bearer $token',
});

h.StreamedResponse response = await request.send();
var a =await h.Response.fromStream(response);
return a; 
  } 
}