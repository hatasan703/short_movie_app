import 'dart:io';

import 'package:atplace/view_models/add_book_view_model.dart';
import 'package:atplace/view_models/add_hotel_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AddHotelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddHotelViewModel(),
      child: Container(
        child: _AddHotelScreenState(),
      ),
    );
  }
}

class _AddHotelScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホテルの動画を追加'),
      ),
      body: Center(
        child: Consumer<AddHotelViewModel>(
          builder: (context, model, _) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () async {
                            await model.getImage(ImageSource.gallery);
                            model.videoController!.play();
                          },
                          child: SizedBox(
                            width: 200,
                            height: 450,
                            child: model.movieFile == null
                                ? Container(
                                    color: Colors.grey,
                                  )
                                : VideoPlayer(model.videoController!),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ホテル名',
                        ),
                        onChanged: (text) {
                          model.hotelName = text;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // ホテル追加の処理
                          model.videoController!.play();
                          try {
                            model.startLoading();
                            await model.addHotel();
                            Navigator.of(context).pop(true);
                          } catch (e) {
                            print(e);
                            final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } finally {
                            model.endLoading();
                          }
                        },
                        child: Text('追加する'),
                      ),
                    ],
                  ),
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
