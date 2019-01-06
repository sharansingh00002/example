import 'dart:async';
import 'validate.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc2 extends Validate{

final _emailController=new BehaviorSubject();
final _passController=new BehaviorSubject();

Stream<String> get email=>_emailController.stream.transform(validateEmail);
Stream<String> get pass=>_passController.stream.transform(validatePass);
Stream<bool> get submitValid=> Observable.combineLatest2(email, pass, (e,p)=>true);

Function(String) get changeEmail=>_emailController.sink.add;
Function(String) get changePass=>_passController.sink.add;

submit()
{
  final e=_emailController.value;
}
}
