import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // この Widget はアプリケーションの根っこです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// （意訳） これはアプリケーションのテーマです。
        /// アプリケーションを "flutter run" コマンドで実行してみてください。
        /// 青いツールバーが表示されるはずです。
        /// では、アプリは起動したまま、
        /// 下に書かれた primarySwatch の値を Colors.green に変更して
        /// "ホットリロード" を実行してみてください
        /// （コンソールから "flutter run" で実行している場合は "r" キーを押します。
        /// Flutter に対応した IDE で実行している場合は
        /// 単純にファイルを保存すればホットリロードが実行されます）。
        /// カウンターがゼロに戻ることなく、
        /// つまりアプリがリスタートすることはありません。
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  /// （訳） この Widget はアプリケーションのホームページです。
  /// これは stateful、つまり State という（この下に定義された）
  /// オブジェクトを持っており、
  /// State には見た目を変化させるためのフィールドが定義されています。

  /// この MyHomePage という Widget クラスは、
  /// その State の設定値を保持するクラスです。
  /// このクラスは親（つまり MyApp） から
  /// 受け取った値（ここでは title）を保持していて、
  /// この title は State の build() メソッドで使われています。
  /// Widget のサブクラスのフィールドは常に
  /// "final" でなければなりません。
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      /// （意訳） この setState を呼び出すことで、
      /// Flutter フレームワークに対して State が保持する
      /// 何らかの値が変化したことを伝えます。
      /// これにより、下に定義した
      /// build() メソッドが再度呼び出され、
      /// 変更後の値が画面上の表示内容に反映されます。
      /// もし _counter の値を
      /// setState() を呼び出すことなく変化させた場合、
      /// build() メソッドが呼び出されずに UI も何も変化しません。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// （意訳） このメソッドは setState が
    /// 呼び出されるたびに実行され直します。
    /// 例えば、上に定義された _incrementCounter メソッドの
    /// 実行が完了された後などです。

    /// フラッターフレームワークは
    /// この build メソッドが高速に呼び出されるように
    /// 最適化されています。
    /// つまり、Flutter アプリの開発者は UI の更新のために
    /// 個別の Widget に対して何かの更新操作を行うのではなく、
    /// 必要なタイミングでこの build メソッドを呼び出して
    /// 全体をリビルドできるようになっています。
    return Scaffold(
      appBar: AppBar(
        /// （意訳） ここで、 MyApp の build() メソッドの中で生成され、
        ///  MyHomePage オブジェクトを経由して受け取った文字列を使って
        /// AppBar のタイトルをセットしています。
        title: Text(widget.title),
      ),
      body: Center(
        /// （意訳） Center はレイアウトのための Widget です。
        /// 子となる Widget をひとつだけ受け取り、
        /// 親に対して中央寄せになるように配置します。
        child: Column(
          ///（意訳） Column もレイアウトのための Widget です。
          /// Column は子のリストを受け取り、それを縦に並べます。
          /// デフォルトでは、子の幅がちょうど収まるだけの幅と、親と同じだけの高さを確保します。

          ///"debug painting" を実行することで
          ///（コンソールでは "p" キーを押します。
          ///Android Studio の場合は Flutter インスペクタの
          /// "Toggle Debug Paint" アクションを選択してください。
          /// Visual Studio の場合は"Toggle Debug Paint" コマンドを
          /// 選択します） それぞれの子Widget の
          /// ワイヤーフレームを確認できます。

          /// Column にはどのように自身のサイズを決定し、
          /// どのように子を配置するかを設定する
          /// 多くのプロパティが用意されています。
          /// ここでは、 mainAxisAlignment を指定することで
          /// 子を縦方向で中心寄せで配置しています。
          /// なお、 "main axis" とは、
          /// Column においては縦方向の軸を意味します。
          /// （また、 "cross axis" は横方向です）
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      ///（意訳） この末尾のカンマは build メソッドの自動フォーマットを良い感じにするためのものです。
    );
  }
}
