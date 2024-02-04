import 'package:bukizz/data/providers/auth/updateUserData.dart';
import 'package:bukizz/data/repository/my_orders.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bukizz/data/providers/cart_provider.dart';
import 'package:bukizz/data/providers/header_switch.dart';
import 'package:bukizz/data/providers/product_provider.dart';
import 'package:bukizz/data/providers/school_repository.dart';
import 'package:bukizz/data/providers/stationary_provider.dart';
import 'package:bukizz/data/repository/auth_view_repository.dart';
import 'package:bukizz/data/repository/cart_view_repository.dart';
import 'package:bukizz/data/repository/product_view_repository.dart';
import 'package:bukizz/data/repository/user_repository.dart';
import '../../data/providers/auth/firebase_auth.dart';
import '../../data/providers/bottom_nav_bar_provider.dart';
import '../../data/repository/order_view_repository.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(
    create: (_) => HeaderSwitchProvider(),
  ),
  ChangeNotifierProvider(create: (_) => SchoolDataProvider()),
  ChangeNotifierProvider(create: (_) => ProductProvider()),
  ChangeNotifierProvider(create: (_) => CartProvider()),
  ChangeNotifierProvider(create: (_) => UserRepositoryProvider()),
  ChangeNotifierProvider(create: (_) => ProductViewRepository()),
  ChangeNotifierProvider(create: (_) => CartViewRepository()),
  ChangeNotifierProvider(create: (_) => OrderViewRespository()),
  ChangeNotifierProvider(
    create: (_) => BottomNavigationBarProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => StationaryProvider(),
  ),
  ChangeNotifierProvider(create: (_) => AuthView()),
  ChangeNotifierProvider(create: (_) => UpdateUserData()),
  ChangeNotifierProvider(create: (_) => MyOrders()),
];
