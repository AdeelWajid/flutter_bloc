
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
   const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginBloc, LoginStates>(
    buildWhen: (currentState, nextState) => currentState.password != nextState.password
    ,builder: ( context, state) {
      return TextFormField(
        keyboardType: TextInputType.text,
        focusNode: passwordFocusNode,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(PasswordChanged(password: value));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        onFieldSubmitted: (value) {},
      );
    });
  }
}
