import 'package:atplace/view_models/login_view_model.dart';
import 'package:atplace/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログインページ'),
        ),
        body: Center(
          child: Consumer<LoginViewModel>(builder: (context, model, _) {
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
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 54.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ElevatedButton(
                              child: Text(
                                'ログイン',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                model.startLoading();
                                // 追加処理
                                try {
                                  await model.login();
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
                          TextButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: Text('新規登録の方はこちら')),
                        ],
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
