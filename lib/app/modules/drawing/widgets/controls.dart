
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Controls extends StatefulWidget {
  final PainterController? pc;
  final Uint8List? imgBytesList;

  const Controls({
    super.key,
    this.pc,
    this.imgBytesList,
  });

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        

        const SizedBox(height: 30),

        // Colors, background & delete
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
                heroTag: 1,
                backgroundColor: Colors.red,
                onPressed: () => widget.pc?.setStrokeColor(Colors.red)),
            FloatingActionButton(
                heroTag: 2,
                backgroundColor: Colors.yellowAccent,
                onPressed: () =>
                    widget.pc?.setStrokeColor(Colors.yellowAccent)),
            FloatingActionButton(
                heroTag: 3,
                backgroundColor: Colors.black,
                onPressed: () => widget.pc?.setStrokeColor(Colors.black)),
            FloatingActionButton(
                heroTag: 4,
                backgroundColor: Colors.green,
                onPressed: () => widget.pc?.setStrokeColor(Colors.green)),
           
            FloatingActionButton(
                heroTag: 5,
                backgroundColor: Colors.red,
                child: const Icon(Icons.delete_outline),
                onPressed: () => widget.pc
                    ?.clearContent(clearColor: const Color(0xfff0f0ff))),
          ],
        ),

        const SizedBox(height: 30),

        /// min stroke width
        Row(
          children: [
            Text('  min stroke '
                '${widget.pc?.getState()!.strokeMinWidth.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.strokeMinWidth ?? 0,
                  min: 1,
                  max: 20,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc?.setMinStrokeWidth(value);
                      if (widget.pc!.getState()!.strokeMinWidth >
                          widget.pc!.getState()!.strokeMaxWidth) {
                        widget.pc?.setMinStrokeWidth(
                            widget.pc!.getState()!.strokeMaxWidth);
                      }
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

        /// max stroke width
        Row(
          children: [
            Text('  max stroke '
                '${widget.pc?.getState()!.strokeMaxWidth.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.strokeMaxWidth ?? 0,
                  min: 1,
                  max: 40,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc!.setMaxStrokeWidth(value);
                      if (widget.pc!.getState()!.strokeMaxWidth <
                          widget.pc!.getState()!.strokeMinWidth) {
                        widget.pc!.setMaxStrokeWidth(
                            widget.pc!.getState()!.strokeMinWidth);
                      }
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

        /// blur
        Row(
          children: [
            Text('  blur '
                '${widget.pc?.getState()!.blurSigma.toStringAsFixed(1)}'),
            Expanded(
              child: Slider.adaptive(
                  value: widget.pc?.getState()?.blurSigma ?? 0,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (value) {
                    if (widget.pc != null) {
                      widget.pc!.setBlurSigma(value);
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),

       
      ],
    );
  }
}
