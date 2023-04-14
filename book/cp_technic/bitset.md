# bitsetの活用


## 部分和問題の高速化
例題: [アルゴ式|部分和問題](https://algo-method.com/tasks/337)  
1 つの箱と N 個のボールを持っています。  
ボールには 0 から N−1 までの番号が振られており、 ボール i の重さは $W_i$です。  
箱にいくつかのボールを、重さの合計が M となるよう番号の小さい方から順に入れようと考えています。
このようなボールの入れ方は存在するか答えてください。

ただし、M は 1 以上 10000 以下の整数。
```cpp
int main() {
    int N, M; cin >> N >> M;
    vector<int> W(N);
    for (int i = 0; i < N; i++){
        cin >> W[i];
    }
    bitset<10009> dp;
    dp[0] = 1;
    for (int i = 0; i < N; i++){
        dp |= dp << W;
    }
    cout << (dp[M] ? "Yes" : "No") << endl;
    return 0;
}
```
二次元dpを用いて以下のように二重ループを用いる必要があるところを、**bitの `|=` 演算を利用して、遷移可能マスを一気に 1 に変更することで、1重ループの実装で収まっている。**
<details>
<summary>二次元dpによる解法</summary>

```cpp
int main() {
    // 入力
    int N, M;
    cin >> N >> M;
    vector<int> W(N);
    for (int i = 0; i < N; ++i) cin >> W[i];

    // (N+1) × (M+1) のマスを用意する
    vector<vector<bool>> dp(N+1, vector<bool>(M+1, false));

    // 初期状態 (左上のマスにコマがありうる)
    dp[0][0] = true;

    // 各マス (i, j) から「真下」「右下」へコマを渡していく
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j <= M; ++j) {
            // マス (i, j) にコマが行く可能性がない場合はスキップ
            if (!dp[i][j]) continue;

            // 真下マスへコマを渡す
            dp[i+1][j] = true;

            // 右下マス (あるならば) へコマを渡す
            if (j+W[i] <= M) dp[i+1][j+W[i]] = true;
        }
    }

    // 答え
    if (dp[N][M]) cout << "Yes" << endl;
    else cout << "No" << endl;
}
```

</details>