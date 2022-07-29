import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tryit_customer_app/Authentication/Signup.dart';
import 'package:tryit_customer_app/Authentication/auth_file.dart';
import 'package:tryit_customer_app/blocs/cart/cart_bloc.dart';
import 'package:tryit_customer_app/config/app_router.dart';
import 'package:tryit_customer_app/models/CartController.dart';
import 'package:tryit_customer_app/repositories/categories/category_repository.dart';
import 'package:tryit_customer_app/repositories/products/product_repository.dart';
import 'package:tryit_customer_app/screens/home/Widget/cart/Checkout.dart';
import 'package:tryit_customer_app/screens/home/home.dart';
import 'package:tryit_customer_app/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tryit_customer_app/config/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Authentication/Login.dart';
import 'blocs/blocs.dart';
import 'blocs/catgeory/category_bloc.dart';
import 'blocs/products/product_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 // runApp(GetMaterialApp(
 //     debugShowCheckedModeBanner: false,
 //     home:MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create:(_) => CartBloc()..add((LoadCart()))),
        BlocProvider(create:(_) => CategoryBloc(categoryRepository: CategoryRepository())..add((LoadCategories()))),
        BlocProvider(create:(_) => ProductBloc(productRepository: ProductRepository())..add((LoadProducts()))),



      ] ,
      child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
         // home: const HomeScreen(),
           onGenerateRoute: AppRouter.onGenerateRoute,
           initialRoute: CheckoutScreen.routeName,
         //  routes: {
         //    '/': (context) => SplashScreen(),
         //    '/login': (context) => LoginPage(),
         //    '/register': (context) => SignupPage(),
         //    '/home':(context) => HomeScreen()
         // },
        ));
  }
}

// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//
//   Future<void> init() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//       }
//       notifyListeners();
//     });
//   }
//
//   ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
//
//   ApplicationLoginState get loginState => _loginState;
//
//   String? _email;
//
//   String? get email => _email;
//
//   void startLoginFlow() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   Future<void> verifyEmail(String email,
//       void Function(FirebaseAuthException e) errorCallback,) async {
//     try {
//       var methods =
//       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   Future<void> signInWithEmailAndPassword(String email,
//       String password,
//       void Function(FirebaseAuthException e) errorCallback,) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   Future<void> registerAccount(String email,
//       String displayName,
//       String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user!.updateDisplayName(displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }
