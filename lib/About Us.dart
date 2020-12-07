import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("About Our Company")),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pascal Inc.",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.normal)),
                SizedBox(height: 20, width: 20),
                Text("A company that improves lives and impacts society",
                  overflow: TextOverflow.ellipsis,
                ),
                /*Row(
                  children: [Text("Lorem Ipsum")],
                  // children: [
                  //   Flexible(
                  //     child: Text(
                  //       'Add long text here',
                  //       maxLines: 1,
                  //       softWrap: false,
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //   ),
                  // ],
                  
                )*/
              ])
        ]));
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
