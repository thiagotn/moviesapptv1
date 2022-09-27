import 'package:flutter/material.dart';

class CarouselName extends StatelessWidget {
  final String? name;

  const CarouselName({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return (name == null)
        ? Container()
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ],
          );
  }
}
