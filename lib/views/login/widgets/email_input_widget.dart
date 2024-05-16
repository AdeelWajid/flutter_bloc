import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/bloc/login/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
    buildWhen: (currentState, nextState) => currentState.email != nextState.email
    ,builder: (context, state) {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocusNode,
        decoration: const InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(EmailChanged(email: value));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          }
          return null;
        },
        onFieldSubmitted: (value) {},
      );
    });
  }
}
