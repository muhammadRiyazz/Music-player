import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/mostplay/mostplay_bloc.dart';
import 'package:mixago_music/presentaion/main%20widget/songlist.dart';

class Lastpart extends StatelessWidget {
  const Lastpart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostplayBloc, MostplayState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'MOST PLAYED',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              '${state.mostplayedlist.length} SONGS',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            songlist(mysonglist: state.mostplayedlist),
          ],
        );
      },
    );
  }
}
