# 第２章 言語資源と言語モデル
## 第２章 練習問題
### 2.1
>上に述べたようにシソーラスやオントロジーにはさまざまなものがある．
インターネットを利用してこれらのシソーラスを利用することができるので，それぞれのシソーラスの差異を調べてみよう．
どのような違いが見られ，またその違いはなぜ生じるのか，考えてみよう．

### 2.2
>Nグラム言語モデルで単語列が生起する確率を求めるとき，コーパス中に現れない単語が出現する問題をゼロ頻度問題と呼ぶ．
このような時にどのような対処法が考えられるだろうか．
 - スムージング（smoothing）
   - 加算スムージング
       $$ p(w_i \mid w_{i-N+1}, \dots, w_{i-1}) = \frac{c(w_{i-N+1}, \dots, w_{i-1}, w_i) + \alpha}{c(w_{i-N+1}, \dots, w_{i-1}) + \alpha V} $$
      - $\alpha \ (>0)$ は定数パラメータ，$V$ はコーパスに含まれる異なる文字列の総数？
   - バックオフ（Back-Off），など．

### 2.3
>近年ではNグラム言語モデル以外にもさまざまな言語モデルが提案されている．
どのような言語モデルが他に存在するのか，調べてみよう．
 - Word2Vec, BERT, etc.