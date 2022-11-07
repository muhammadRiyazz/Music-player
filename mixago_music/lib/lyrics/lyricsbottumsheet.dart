import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

lyricsbottumsheet({required BuildContext context, required String larics}) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.amber.withOpacity(0.0),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlassContainer(
              color: Colors.black.withOpacity(0.5),
              blur: 4,
              height: size.height * 0.80,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: SingleChildScrollView(
                  child: Text(
                    larics,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GlassContainer(
                  child: Center(child: Text('Cancel')),
                  color: Colors.black.withOpacity(0.5),
                  blur: 4,
                  height: 40,
                  width: double.infinity,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
