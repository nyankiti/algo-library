# 問題を解く際の思考の巡らせ方

1. 問題で要求されていることは言い換えられないか？
2. 入力の大きさから解放を絞る
3. 全探索で解けるか考える
4. 分解して考える
    - 行と列をそれぞれ別で捉える
    - 2次元の問題を1次元に分解して独立に考える
5. 固定して考える
    - 変数のうち一つを固定すると効率化できる場合が
6. 対称性を考える
7. 逆の発想ができないか？
   - 補集合を全探索して引く
   - 候補を生み出すのではなく、scheckメソッドを用意して、候補を全探索する
8. 偶奇性に注目する
9. 操作の順番を入れ替えても良いか
10. 操作を逆順に考えるとどうか
11. 区間問題


参考
- [競技プログラミングで解法を思いつくための典型的な考え方](https://algo-logic.info/how-to-think-cp/)