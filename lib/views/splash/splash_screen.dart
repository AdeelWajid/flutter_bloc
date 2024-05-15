
import 'package:flutter/material.dart';
import 'package:flutter_blocs/config/components/itnernet_exceiption_widget.dart';
import 'package:flutter_blocs/config/components/loading_widget.dart';

import '../../config/components/round_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
          
            children: [
              InternetExceptionWidget(onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
