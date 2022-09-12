import 'package:video_curation_admin/utils/index.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin',
      initialRoute: Routes.root,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsScreen(),
    );
  }
}
