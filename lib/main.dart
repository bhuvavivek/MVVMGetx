import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmwithget/data/response/status.dart';
import 'package:mvvmwithget/res/getx_localization/languages.dart';
import 'package:mvvmwithget/res/routes/routes.dart';
import 'package:mvvmwithget/res/routes/routesname.dart';
import 'package:mvvmwithget/view_model/controllers/home/home_controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.homeScreen,
      getPages: AppRoutes.appRoute(),
      locale: const Locale('hi', 'IN'),
      fallbackLocale: const Locale('hi', 'IN'),
      translations: Language(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeController = Get.put(HomeController());
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      homeController.getHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              switch (homeController.status.value) {
                case Status.Loadig:
                  return const CircularProgressIndicator();

                case Status.Completed:
                  return Expanded(
                    child: Center(
                      child: Container(
                          // height: 400,
                          color: Colors.amber,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(homeController
                                      .homeData.value.data![index].firstName),
                                  subtitle: Text(homeController
                                      .homeData.value.data![index].lastName),
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          homeController.homeData.value
                                              .data![index].avatar)),
                                );
                              },
                              itemCount:
                                  homeController.homeData.value.data!.length)),
                    ),
                  );
                case Status.Error:
                  return Center(
                      child: Container(
                    child: Text(homeController.error.value),
                  ));
              }
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
