import 'package:bloc/bloc.dart';
import 'package:go2climb/screens/auth/blocs/auth_events.dart';
import 'package:go2climb/screens/auth/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);


  // @override 
  // Stream<AuthState> mapEventToState(AuthEvents event){

  // }
}
