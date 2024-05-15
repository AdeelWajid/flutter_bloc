import 'package:flutter/material.dart';
import 'package:flutter_blocs/config/color/app_colors.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const InternetExceptionWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery
              .sizeOf(context)
              .height * 0.15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              textAlign: TextAlign.center,
              'We are unable to show results.\nPlease check your data\nconnection.',
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                  fontSize: 20
              ),
            )),
        SizedBox(
          height: MediaQuery
              .sizeOf(context)
              .height * 0.1,
        ),
        ElevatedButton(onPressed:onPressed, child: Text('Retry', style: Theme
            .of(context)
            .textTheme
            .bodySmall,))
      ],
    );
  }
}
