import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagenesRegistro extends StatefulWidget {
  final List<XFile> imagenes;
  final Function(List<XFile>) setImages;
  const ImagenesRegistro(
      {super.key, required this.imagenes, required this.setImages});

  @override
  State<ImagenesRegistro> createState() => _ImagenesRegistroState();
}

class _ImagenesRegistroState extends State<ImagenesRegistro> {
  late List<XFile> imagenesLocal;

  @override
  void initState() {
    imagenesLocal = widget.imagenes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: imagenesLocal.map((e) => _imagesShow(e)).toList(),
        ),
        OutlinedButton(
          onPressed: imagenesLocal.isNotEmpty
              ? null
              : () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? photo =
                      await picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    imagenesLocal.add(photo);
                    widget.setImages(imagenesLocal);
                  }
                },
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(color: Colors.green),
            )),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Agregar imagen',
                style: TextStyle(
                    color:
                        imagenesLocal.isNotEmpty ? Colors.grey : Colors.green,
                    fontSize: 18),
              ),
              const Icon(
                Icons.add,
                color: Colors.green,
                size: 25,
              ),
            ],
          ),
        )
      ],
    );
  }

  Stack _imagesShow(XFile e) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          height: 130,
          width: 90,
          child: Image.file(
            File(e.path),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: IconButton(
            onPressed: () {
              setState(() {
                imagenesLocal = [];
              });
            },
            splashColor: Colors.red,
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
