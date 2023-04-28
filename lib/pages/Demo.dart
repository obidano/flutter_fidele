import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _columnWidget());
  }

  Widget _columnWidget() {
    return Column(
      children: [
        Flexible(child: _containerWidget()),
      ],
    );
  }

  Widget _containerWidget() {
    return Container(
        color: Colors.orange,
        height: double.infinity,
        width: double.infinity,
        child: _logoText());
  }

  Widget _logoText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),

        Icon(
          Icons.zoom_in_map,
          size: 160,
          color: Colors.white,
        ),
        Text(
          "Fidele App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Expanded(child: SizedBox(height: 10,)),

        _buttonWidget(),
        SizedBox(height: 20,)
      ],
    );
  }

  Widget _buttonWidget(){
    return ElevatedButton(onPressed: (){}, child: Text("Bienvenue"));
  }
}
