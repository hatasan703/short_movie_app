import 'package:atplace/view_models/book_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 値（ここでは "Hello world"）を格納する「プロバイダ」を作成します。
// プロバイダを使うことで値のモックやオーバーライドが可能になります。
// final helloWorldProvider = Provider((_) => 'Hello world');
// final provider = Provider((ref) {
//   // `ref` を通じて他のプロバイダを利用する
//   final repository = ref.watch(helloWorldProvider);

//   return SomeValue(repository);
// })

// void main() {
//   runApp(
//     // プロバイダをウィジェットで利用するには、アプリ全体を
//     // `ProviderScope` ウィジェットで囲む必要があります。
//     // ここに各プロバイダのステート（状態）・値が格納されていきます。
//     ProviderScope(
//       child: BookListScreen(),
//     ),
//   );
// }

// StatelessWidget の代わりに Riverpod の ConsumerWidget を継承します。
class BookListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(bookProvider);

    return Scaffold(
        // ここで_providerがずっと使える
        );
  }
}
