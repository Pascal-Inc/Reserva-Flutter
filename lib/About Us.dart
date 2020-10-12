import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 200,
          ),
          SizedBox(height: 30),
          Text(
            "Pascal Inc.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Flexible(
              child: Text(
                'Your Text Your Text Your Text Your Text Your Text Your Text Your Text Your Text Your Text Your Text',
                textAlign: TextAlign.center,
                softWrap: true,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          RaisedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('Contact Us'))
        ],
      ),
    );
  }
}

_launchURL() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'granwyn_tan@s2019.ssts.edu.sg',
    query:
        'subject=Reserva Feedback&body=Dear Pascal Inc,\n\n\nReserva User', //add subject and body here
  );
  var url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Positioned(
//     left: position.dx,
//     top: position.dy,
//     child: new Draggable(
//       data: widget.index,
//       onDragStarted: widget.setDragging,
//       onDraggableCanceled: (velocity, offset) {
//         setState(() {
//           position = offset;
//           widget.secondCallback(offset, widget.index);
//           widget.endDragging();
//         });
//       },
//       child: new GestureDetector(
//         onTap: () {
//           widget.callback(widget.caption, widget.index);
//         },
//         child: new Text(
//             widget.caption.caption,
//             style: new TextStyle(
//               color: widget.caption.color,
//               fontSize: widget.caption.fontSize,
//             ),
//           ),
//       ),
//       feedback: new Material(
//         type: MaterialType.transparency,
//         child: new Text(
//           widget.caption.caption,
//           style: new TextStyle(
//               color: widget.caption.color,
//               fontSize: widget.caption.fontSize),
//           softWrap: true,
//         ),
//       ),
//     ));
