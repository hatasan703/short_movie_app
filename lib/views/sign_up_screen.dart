import 'package:atplace/view_models/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録'),
        ),
        body: Center(
          child: Consumer<SignUpViewModel>(builder: (context, model, _) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            controller: model.emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'mail address',
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller:
                                model.passwordContoller, // Controller実装必要
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'password',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 54.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          child: Text(
                            '新規登録',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            model.startLoading();

                            // 追加処理
                            try {
                              await model.signUp();
                              Navigator.of(context).pop();
                              print('クリックされました');
                            } catch (e) {
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
                        ),
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
