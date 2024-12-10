import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_finger_painter/app/modules/common/coordinates_extension.dart';

class ConnectingController extends GetxController {
  String _text = '';

  get text => _text;
  set text(val) => _text = val;

  late PainterController? painterController;
  final aKey = GlobalKey();
  final nKey = GlobalKey();
  final tKey = GlobalKey();
  final columnKey = GlobalKey();

  @override
  void onInit() {
    initPaintingController();
    super.onInit();
  }

  void initPaintingController() {
    painterController = PainterController()
      ..setPenType(PenType.pencil)
      ..setStrokeColor(Colors.grey.shade500)
      ..setMinStrokeWidth(7)
      ..setMaxStrokeWidth(10)
      ..setBlurSigma(0.0)
      ..setBlendMode(BlendMode.srcOver);
    painterController?.clearContent(clearColor: const Color(0xfff0f0ff));
  }

  @override
  void onClose() {
    //painterController.clearContent(clearColor: const Color(0xfff0f0ff));
    painterController = null;
  }

  void onDrawingEnded() {
    List<Offset>? points = painterController?.getPoints();
    double columnLeft = columnKey.globalPaintBounds!.left;
    double columnTop = columnKey.globalPaintBounds!.top;
    Map<String, String> letters = {};
    for (Offset o in points!) {
      double x = columnLeft + o.dx;
      double y = columnTop + o.dy;

      double aLeft = aKey.globalPaintBounds!.left;
      double aRight = aKey.globalPaintBounds!.right;
      double aTop = aKey.globalPaintBounds!.top;
      double aBottom = aKey.globalPaintBounds!.bottom;
      if (x > aLeft && x < aRight && y > aTop && y < aBottom) {
        letters["A"] = "A";
      }
      double nLeft = nKey.globalPaintBounds!.left;
      double nRight = nKey.globalPaintBounds!.right;
      double nTop = nKey.globalPaintBounds!.top;
      double nBottom = nKey.globalPaintBounds!.bottom;
      if (x > nLeft && x < nRight && y > nTop && y < nBottom) {
        letters["N"] = "N";
      }

      double tLeft = tKey.globalPaintBounds!.left;
      double tRight = tKey.globalPaintBounds!.right;
      double tTop = tKey.globalPaintBounds!.top;
      double tBottom = tKey.globalPaintBounds!.bottom;
      if (x > tLeft && x < tRight && y > tTop && y < tBottom) {
        letters["T"] = "T";
      }
    }
    for (String key in letters.keys) {
      _text += key;
    }

    update(['text']);
    //painterController?.clearContent(clearColor: const Color(0xfff0f0ff));
    //initPaintingController();
   // update(['letters']);

    //printCoordinates();

  }

  void printCoordinates() {
    print('points');

    List<Offset>? points = painterController?.getPoints();
    for (Offset o in points!) {
      print(o.dx.toString() + ' ' + o.dy.toString());
    }

    print('widgets');
    print(aKey.globalPaintBounds!.left.toString() +
        ' ' +
        aKey.globalPaintBounds!.right.toString() +
        ' ' +
        aKey.globalPaintBounds!.top.toString() +
        ' ' +
        aKey.globalPaintBounds!.bottom.toString());

    print(nKey.globalPaintBounds!.left.toString() +
        ' ' +
        nKey.globalPaintBounds!.right.toString() +
        ' ' +
        nKey.globalPaintBounds!.top.toString() +
        ' ' +
        nKey.globalPaintBounds!.bottom.toString());

    print(tKey.globalPaintBounds!.left.toString() +
        ' ' +
        tKey.globalPaintBounds!.right.toString() +
        ' ' +
        tKey.globalPaintBounds!.top.toString() +
        ' ' +
        tKey.globalPaintBounds!.bottom.toString());

    print(columnKey.globalPaintBounds!.left.toString() +
        ' ' +
        columnKey.globalPaintBounds!.right.toString() +
        ' ' +
        columnKey.globalPaintBounds!.top.toString() +
        ' ' +
        columnKey.globalPaintBounds!.bottom.toString());
  }

  void clear() {
   painterController?.clearContent(clearColor: Colors.transparent);

   //  initPaintingController();
     _text = '';
     update(['text']);   
     update(['letters']);
  }
}
