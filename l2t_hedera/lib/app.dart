import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_hedera/home/view/home_page.dart';
import 'package:l2t_hedera/progress/bloc/progress_bloc.dart';
import 'package:l2t_hedera/progress/progress.dart';
import 'package:l2t_hedera/navbar/view/navbar.dart';

import 'auth/bloc/authentication_bloc.dart';

import 'package:l2t_hedera/scrolling_navbar.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => ProgressBloc(Progress()),
          ),
        ],
        child: MaterialApp(home: HomeView()),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: Navbar(),
    //   body: PageView.builder(

    //   ),
    // );

    return ScrollingNavbar(
        appBar: Navbar(),
        scrollDirection: Axis.horizontal,
        headings: [
          'one',
          'two',
          'three',
          'four',
          'five',
        ],
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ]);
  }
}
