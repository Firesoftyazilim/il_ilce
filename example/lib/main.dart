import 'package:flutter/material.dart';
import 'package:il_ilce/conttroler/il_ilce_conttroler.dart';
import 'package:il_ilce/il_ilce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// drop down dan seçilen il ilçeyi kontrol eder
  IlIlceController controller = IlIlceController();

  String? arananIl;
  String? arananIlce ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        /// Drop down dan gelen il
        Text(
          controller.selectedCity.city,
          style: TextStyle(fontSize: 30),
        ),
        /// drop down dan gelen ilçe
        Text(
          controller.selectedCity.district,
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        /// Drop down il ilçe seçici
        IlIlceDropDown(
          controller: controller,
        ),

        /// drop dovn dan seçilen il ve ilçeyi getirir
        ElevatedButton(onPressed: () => setState(() {}), child: Text("Getir")),
        const SizedBox(
          height: 20,
        ),

        /// il arama dialogu
        ElevatedButton(onPressed: () async {
          final value = await IlIlceDialog.instance.selectIl(context);
          setState(() {
            arananIl = value;
            print(value);
          });
        }, child: Text(arananIl??"İl Ara")),

        const SizedBox(
          height: 20,
        ),

        /// il seçme dialogu
        ElevatedButton(
                onPressed: () {
                  if(arananIl==null){
                    return;
                  }
                IlIlceDialog.instance.selectIlce(context,il:arananIl).then((value) {
                  setState(() {
                    arananIlce = value;
                  });
                });}

            , child: Text(arananIlce??"İlçe Ara"))
      ],
    ));
  }
}
