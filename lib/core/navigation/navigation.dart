import './routes.enum.dart';
import 'package:get/get.dart';


class Navigation{

  static final String home = Routes.home.url;
  
  static List<GetPage> getRoutes(){    

    List<GetPage> pages = Routes.values.map( 
      (route) => GetPage(name: route.url, page:() => route.page) 
    ).toList();
    
    return pages;
  }

  static void goToPage({required Routes page}) => Get.toNamed( page.url );

}  