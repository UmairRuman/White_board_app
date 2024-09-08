import 'package:flutter/material.dart';
import 'package:khurumbhi_assignment/Widgets/CanvasWidget/shape_canvas_painter_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/Stroke_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/arrow_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/color_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/pen_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/redo_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/shape_icon_widget%20.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/text_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/IconWidgets/undo_icon_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/arrow_text_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/color_text_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/pen_text_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/shape_text_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/stroke_text_widget.dart';
import 'package:khurumbhi_assignment/Widgets/TextWidgets/text_Text_widget.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 92,
            child: Stack(
              children: [
                Positioned(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.9,
                    top: 0,
                    right: 0,
                    child: const Center(child: ShapeCanvasWidget())),
                const Positioned(
                    top: 5, left: 10, width: 50, child: PenIconWidget()),
                const Positioned(
                    top: 30, left: 8, width: 50, child: PenTextWidget()),
                const Positioned(
                    top: 55, left: 10, width: 500, child: ShapeIconWidget()),
                const Positioned(
                    top: 80, left: 3, width: 50, child: ShapeTextWidget()),
                const Positioned(
                    top: 105, width: 200, child: StrokeIconWidget()),
                const Positioned(
                    top: 130, left: 3, width: 50, child: StrokeTextWidget()),
                const Positioned(
                    top: 155, left: 10, width: 600, child: ColorIconWidget()),
                const Positioned(
                    top: 180, left: 3, width: 50, child: ColorTextWidget()),
                const Positioned(top: 205, left: 10, child: TextIconWidget()),
                const Positioned(
                    top: 230, left: 8, width: 50, child: TextWidget()),
                const Positioned(
                    top: 255, left: 8, width: 200, child: ArrowIconWidget()),
                const Positioned(
                    top: 280, left: 3, width: 200, child: ArrowTextWidget())
              ],
            ),
          ),
          const Expanded(
              flex: 5,
              child: Row(
                children: [
                  Spacer(
                    flex: 70,
                  ),
                  Expanded(flex: 10, child: UndoIconWidget()),
                  Expanded(flex: 10, child: RedoIconWidget()),
                  Spacer(
                    flex: 10,
                  )
                ],
              )),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
