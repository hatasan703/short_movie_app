import 'package:atplace/view_models/add_book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBookViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Center(
          child: Consumer<AddBookViewModel>(builder: (context, model, _) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await model.getImage(ImageSource.gallery);
                        },
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: model.imageFile == null
                              ? Container(
                                  color: Colors.grey,
                                )
                              : Image.file(model.imageFile!),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '本のタイトル',
                        ),
                        onChanged: (text) {
                          model.title = text;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '本の著者',
                        ),
                        onChanged: (text) {
                          model.author = text;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // 追加の処理
                          try {
                            model.startLoading();
                            await model.addBook();
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
                  )
              ],
            );
          }),
        ),
      ),
    );
  }
}
