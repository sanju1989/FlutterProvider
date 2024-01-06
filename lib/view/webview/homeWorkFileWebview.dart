// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:skdoosh/spacing.dart';
//
//
// import 'colors.dart';
//
// class HomeWorkFileWebview extends StatefulWidget {
//   String url;
//   HomeWorkFileWebview({super.key, required this.url});
//
//   @override
//   State<HomeWorkFileWebview> createState() => _HomeWorkFileWebviewState();
// }
//
// class _HomeWorkFileWebviewState extends State<HomeWorkFileWebview> {
//   InAppWebViewController? _webViewController;
//   String? extension;
//   String urls = "";
//   setUrl() {
//     extension = widget.url.substring(widget.url.lastIndexOf("."));
//     if (extension!.toLowerCase() == ".jpg" ||
//         extension!.toLowerCase() == ".jpeg") {
//       setState(() {
//         urls = widget.url;
//       });
//     } else if (extension!.toLowerCase() == ".png") {
//       setState(() {
//         urls = widget.url;
//       });
//     }
//     else if(extension!.toLowerCase()==".pdf"){
//       setState(() {
//         urls="https://docs.google.com/viewer?url=${widget.url}";
//       });
//     }
//     else {
//       setState(() {
//         //urls = "https://docs.google.com/viewer?url=${widget.url}";
//         urls=widget.url;
//
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     setUrl();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryBg,
//       body: SafeArea(
//         child: Container(
//           height: screenHight(context),
//           width: screenWidth(context),
//           color: Colors.white,
//           child: InAppWebView(
//             initialUrlRequest: URLRequest(
//               url: Uri.parse(urls),
//             ),
//             onWebViewCreated: (InAppWebViewController controller) {
//               _webViewController = controller;
//             },
//             onLoadStart: (controller, url) {
//               setState(() {
//                 urls = url.toString();
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }