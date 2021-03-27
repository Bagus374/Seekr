part of 'pages.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final PageBloc _pageBloc = PageBloc();
  int currentIndex = 0;
  PageController _controller;
  var result;

  @override
  void initState() {
    // _pageBloc.add(GoToOnboardPage());
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contenst.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        contenst[i].image,
                        height: 300,
                      ),
                      Text(
                        contenst[i].title,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contenst[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contenst.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
              height: 60,
              // margin: EdgeInsets.all(40),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                    currentIndex == contenst.length - 1 ? "Continue" : "Next"),
                onPressed: () {
                  if (currentIndex == contenst.length - 1) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignInPage(),
                        ));
                    // MaterialPageRoute(
                    //     builder: (BuildContext context) => SignInPage()));
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ))
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

// class Onboarding extends StatefulWidget {
//   @override
//   _OnboardingState createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   final PageBloc _pageBloc = PageBloc();

//   @override
//   void initState() {
//     _pageBloc.add(GoToOnboardPage());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     context
//         .bloc<ThemeBloc>()
//         .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.white,
//         child: BlocProvider(
//           create: (_) => _pageBloc,
//           child: BlocListener<PageBloc, PageState>(
//             listener: (context, state) {
//               if (state is Loaded2) {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (BuildContext context) => SignInPage()));
//               }
//             },
//             child: _buildSplashWidget(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSplashWidget() {
//     return Center(
//       child: Text(
//         "SEEKR2",
//         style: TextStyle(fontSize: 35, color: Colors.black),
//       ),
//     );
//   }
// }
