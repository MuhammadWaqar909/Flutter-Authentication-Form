import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: const Text(
        "Dashboard",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
