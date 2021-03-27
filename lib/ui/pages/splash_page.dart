part of 'pages.dart';

// class SplashPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => StartState();
// }

// class StartState extends State<SplashPage> {
//   @override
//   Widget build(BuildContext context) {
//     return initScreen(context);
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   startTimer() async {
//     var duration = Duration(seconds: 5);
//     return new Timer(duration, route);
//   }

//   route() {
//     Navigator.pushReplacement(context, MaterialPageRoute(
//         builder: (context) => Onboarding()
//       )
//     );
//   }

//   initScreen(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               child: Text(
//                 "SEEKR",
//                 style: blackTextFont.copyWith(fontSize: 35),
//               ),
//             ),
//             Padding(padding: EdgeInsets.only(top: 20.0)),
//             Padding(padding: EdgeInsets.only(top: 20.0)),
//             CircularProgressIndicator(
//               backgroundColor: Colors.black,
//               strokeWidth: 1,
//             )
//           ],
//         ),
//       ),
//     );
//   }  
// }

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageBloc _pageBloc = PageBloc();

  @override
  void initState() {
    _pageBloc.add(GoToSplashPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: BlocProvider(
          create: (_) => _pageBloc,  
          child: BlocListener<PageBloc, PageState>(
            listener: (context, state) {
              if (state is Loaded) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
              }
            },
            child: _buildSplashWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashWidget() {
    return Center(
      child: Text(
        "SEEKR",
        style: TextStyle(fontSize: 35, color: Colors.black),
      ),
    );
  }
}

