import 'dart:async';


class Validate{

 final validateEmail=StreamTransformer<String,String>.fromHandlers(
   handleData: (email,sink){
   if(email.contains("@"))
     sink.add(email);
   else
     sink.addError("Wrong Email");
   }
 );


 final validatePass=StreamTransformer<String,String>.fromHandlers(
 handleData: (pass,sink){
 if(pass.length>4)
 sink.add(pass);
 else
 sink.addError("Enter more characters");
 }
 );

}