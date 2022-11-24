import 'package:bloc/bloc.dart';
import 'package:go2climb/screens/auth/blocs/auth_events.dart';
import 'package:go2climb/screens/auth/blocs/auth_state.dart';
import 'package:go2climb/screens/auth/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository repository;
  AuthBloc(AuthState initialState, this.repository) : super(initialState) {
    on<LoginButtonPressed>(_startEvent);
  }

  _startEvent(LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(LoginInitState());
    emit(LoginLoadingState());
    var data = await repository.login(event.email, event.password);
    if (data['ruc'] != null) {
      emit(AgencyLoginSuccessState());
    } else if (data['lastName'] != null) {
      emit(CustomerLoginSuccessState());
    } else {
      emit(LoginErrorState(message: "There was an error"));
    }
  }

}
