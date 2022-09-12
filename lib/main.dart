import 'package:video_curation_admin/utils/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Routes.root,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootScreen(),
    );
  }
}
