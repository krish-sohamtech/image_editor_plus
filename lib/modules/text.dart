import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_editor_plus/data/layer.dart';
import 'package:nb_utils/nb_utils.dart';

import 'colors_picker.dart';

class TextEditorImage extends StatefulWidget {
  const TextEditorImage({Key? key}) : super(key: key);

  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  Color currentColor = Colors.black;
  double slider = 32.0;
  TextAlign align = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.alignLeft,
                color: align == TextAlign.left
                    ? Colors.white
                    : Colors.white.withAlpha(80)),
            onPressed: () {
              setState(() {
                align = TextAlign.left;
              });
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.alignCenter,
                color: align == TextAlign.center
                    ? Colors.white
                    : Colors.white.withAlpha(80)),
            onPressed: () {
              setState(() {
                align = TextAlign.center;
              });
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.alignRight,
                color: align == TextAlign.right
                    ? Colors.white
                    : Colors.white.withAlpha(80)),
            onPressed: () {
              setState(() {
                align = TextAlign.right;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.check, color: white),
            onPressed: () {
              Navigator.pop(
                context,
                TextLayerData(
                  background: Colors.transparent,
                  text: name.text,
                  color: currentColor,
                  size: slider.toDouble(),
                  align: align,
                ),
              );
            },
            color: Colors.black,
            padding: const EdgeInsets.all(15),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: size.height / 2.2,
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Insert Your Message',
                    hintStyle: TextStyle(color: Colors.white),
                    alignLabelWithHint: true,
                  ),
                  scrollPadding: const EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 99999,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    //   SizedBox(height: 20.0),
                    const Text('Slider Color', style: TextStyle(color: white)),
                    //   SizedBox(height: 10.0),
                    Row(children: [
                      Expanded(
                        child: BarColorPicker(
                          width: 300,
                          thumbColor: Colors.white,
                          cornerRadius: 10,
                          pickMode: PickMode.color,
                          colorListener: (int value) {
                            setState(() {
                              currentColor = Color(value);
                            });
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child:
                            const Text('Reset', style: TextStyle(color: white)),
                      ),
                    ]),
                    //   SizedBox(height: 20.0),
                    const Text('Slider White Black Color',
                        style: TextStyle(color: white)),
                    //   SizedBox(height: 10.0),
                    Row(children: [
                      Expanded(
                        child: BarColorPicker(
                          width: 300,
                          thumbColor: Colors.white,
                          cornerRadius: 10,
                          pickMode: PickMode.grey,
                          colorListener: (int value) {
                            setState(() {
                              currentColor = Color(value);
                            });
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child:
                            const Text('Reset', style: TextStyle(color: white)),
                      )
                    ]),
                    Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          Center(
                            child: Text(
                              'Size Adjust'.toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              value: slider,
                              min: 0.0,
                              max: 100.0,
                              onChangeEnd: (v) {
                                setState(() {
                                  slider = v;
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  slider = v;
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
