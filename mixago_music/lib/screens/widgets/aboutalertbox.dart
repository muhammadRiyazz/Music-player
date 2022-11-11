import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

aboutalert({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      final size = MediaQuery.of(context).size;
      return Dialog(
        backgroundColor: Colors.amber.withOpacity(0.0),
        child: GlassContainer(
          color: Colors.black.withOpacity(0.04),
          height: size.height * 0.18,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      bottom: size.height * 0.01, top: size.height * 0.02),
                  child: const Text(
                    'MIXAGO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    textAlign: TextAlign.center,
                    'MIXAGO is a Offline Music Player Created by MUHAMMAD RIYAZ',
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.blue),
                        ))),
              ],
            ),
          ),
        ),
      );
    },
  );
}
