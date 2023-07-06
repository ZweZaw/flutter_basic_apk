import 'package:flutter/material.dart';
class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {

  int timeValue = 0; // will be show in UI
  bool paused= true;

  final Stream<int> periodicStream = Stream.periodic(const Duration(milliseconds: 1000),(i) => i);
  int previousStreamValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      child: StreamBuilder(
        stream: periodicStream,

        builder: (BuildContext context, AsyncSnapshot<int>snapshot){
          if(snapshot.hasData){
            if(snapshot.data != previousStreamValue){
              print('Latest Snapshot from stream: ${snapshot.data}');
              if(!paused){
                timeValue++;
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Stream builder can listen to stream and update UI"),
              Card(
                child: Column(
                  children: [
                    Text("$timeValue",style: Theme.of(context).textTheme.headline4),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => setState(() {
                              paused = !paused;
                            }),
                            icon: Icon(paused? Icons.play_arrow_outlined : Icons.pause_outlined)
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                timeValue= 0;
                                paused= true;
                              });
                            },
                            icon: const Icon(Icons.stop_outlined)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
