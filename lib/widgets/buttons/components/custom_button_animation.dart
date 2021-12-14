import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonHoverAnimation extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final double thickness;
  final Curve curve;
  final int milliseconds;
  final void Function() onTap;
  final Color active;
  final Color nonactive;
  final bool dark;

  const CustomButtonHoverAnimation({
    Key? key,
    required this.height,
    required this.width,
    required this.thickness,
    required this.curve,
    required this.milliseconds,
    required this.title,
    required this.onTap,
    required this.active,
    required this.nonactive,
    required this.dark,
  }) : super(key: key);

  @override
  _CustomButtonHoverAnimationState createState() =>
      _CustomButtonHoverAnimationState();
}

class _CustomButtonHoverAnimationState
    extends State<CustomButtonHoverAnimation> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    bool isdark = widget.dark;

    return Material(
      color: isdark ? widget.nonactive : widget.active,
      child: InkWell(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (val) {
            setState(() {
              animate = true;
              isdark = !isdark;
            });
          },
          onExit: (val) {
            setState(() {
              animate = false;
              isdark = !isdark;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: AnimatedContainer(
                    height: widget.thickness,
                    width: widget.width,
                    color: isdark ? widget.active : widget.nonactive,
                    curve: widget.curve,
                    duration: Duration(milliseconds: widget.milliseconds),
                  )),
              Positioned(
                  left: 0,
                  top: 0,
                  child: AnimatedContainer(
                    width: animate ? widget.width : widget.thickness,
                    height: widget.height,
                    color: isdark ? widget.active : widget.nonactive,
                    curve: widget.curve,
                    duration: Duration(milliseconds: widget.milliseconds),
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    height: widget.thickness,
                    width: widget.width,
                    color: isdark ? widget.active : widget.nonactive,
                    curve: widget.curve,
                    duration: Duration(milliseconds: widget.milliseconds),
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    width: widget.thickness,
                    height: widget.height,
                    color: isdark ? widget.active : widget.nonactive,
                    curve: widget.curve,
                    duration: Duration(milliseconds: widget.milliseconds),
                  )),
              AnimatedContainer(
                duration: Duration(milliseconds: widget.milliseconds),
                curve: widget.curve,
                height: widget.height,
                width: widget.width,
                // color: animate
                //     ? Colors.transparent
                //     : Colors.white.withOpacity(0.3),
                child: Center(
                  child: isdark
                      ? Text(
                          widget.title,
                          style: GoogleFonts.mavenPro(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                              color: animate ? Colors.black87: Colors.white),
                        )
                      : Text(
                          widget.title,
                          style: GoogleFonts.mavenPro(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                              color: animate != isdark
                                  ? Colors.white
                                  : Colors.black87),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
