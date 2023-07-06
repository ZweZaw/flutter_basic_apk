import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
class BackDropExample extends StatelessWidget {
  const BackDropExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      backLayerBackgroundColor: Colors.greenAccent,
      frontLayerBackgroundColor: Colors.orangeAccent,
      appBar: BackdropAppBar(
        title: const Text("Backdrop"),
      ),
      headerHeight: 120,
      backLayer: const Center(
        child: Text("Back Layer"),
      ),
      frontLayer: const Center(
        child: Text("This is Front Layer"),
      ),
    );
  }
}
