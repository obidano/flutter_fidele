import 'package:flutter/material.dart';

class BrouillonPage extends StatefulWidget {
  const BrouillonPage({Key? key}) : super(key: key);

  @override
  State<BrouillonPage> createState() => _BrouillonPageState();
}

class _BrouillonPageState extends State<BrouillonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body(){
    return Stack(
      children: [
        Container(height: double.infinity, width: double.infinity, color: Colors.green,),
        Align(alignment: Alignment.center,child: Container(height: 50, width: 50, color: Colors.orange,)),
      ],
    );
  }


}
