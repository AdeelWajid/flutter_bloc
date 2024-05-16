
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvent, LoginStates> {

  LoginBloc() : super(LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    // on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit){
    emit(state.copyWith(password: event.password));
  }
}