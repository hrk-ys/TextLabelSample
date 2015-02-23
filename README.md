# TextLabelSample

リンク付きのテキストを表示する時にいい感じのライブラリを検討

## 調査項目

今回の対象となる項目

- リンクの自動化
- リンクの色指定
- バックグランドでの高さ計算
- 行間の調整
- パフォーマンス

## 対象ライブラリ

### SECoreTextView 

https://github.com/kishikawakatsumi/SECoreTextView

- リンクのハイライトなどは自分でやる

### TTTAttributedLabel

https://github.com/TTTAttributedLabel/TTTAttributedLabel

- Linkの計算は自動でやってくれる
	- dispatch_queueを使ってバックグランドで実装
- 高さ計算は自前でやる必要あり