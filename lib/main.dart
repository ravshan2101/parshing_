import 'package:flutter/material.dart';
import 'package:parshing_/model/empOne.dart';
import 'package:parshing_/seervic/Employee.dart';
import 'package:parshing_/seervic/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Employee? emp;

  void apiParshing() {
    Network.GET(Network.Api, Network.paramsNotempty())
        .then((response) => {print(response), showprint(response!)});
  }

  showprint(String response) {
    Empone empone = Network.parshingg(response);
    if (response != null) {
      print(empone.data!.employee_name);
    } else {
      print('Qaytadan urin ey pokiza');
    }

    setState(() {
      emp = empone.data!;
    });
  }

  @override
  void initState() {
    super.initState();
    apiParshing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Employee')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${emp!.employee_name!} (${emp!.employee_age.toString()})',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                '${emp!.employee_salary!}\$',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ));
  }
}
