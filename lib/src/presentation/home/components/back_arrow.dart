import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 50,
      left: 1,
      child: Container(
        height: size.height * 0.08,
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            elevation: WidgetStateProperty.all(0),
            overlayColor: WidgetStateProperty.resolveWith(
              (states) => Colors.transparent,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              Text(
                'Atras',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
