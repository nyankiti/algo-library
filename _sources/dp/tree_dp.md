# 木 DP
木DP とは、根を一つ固定した木について、以下のように部分木に関する値を利用して計算する動的計画法です。 

`dp[ v ] := 頂点 v を根とする部分木についての何かしらの値`

木が N 頂点から構成されるなら、部分木も N 個できます。よって dp の値を N 個分計算することになります。

DFSを用いてそれぞれの部分木から、ボトムアップ的に dp を計算してく。  
DFSの過程で循環すると計算が終わらないので、木は基本的には根を持ったDAG(有向非循環グラフ)と捉えても差し支えない。


### [DPまとめコンテスト P - Independent Set](https://atcoder.jp/contests/dp/tasks/dp_p)
`dp[v][c]: 頂点 v を根とする部分木を塗る時、頂点vをc色に塗る場合の数`  
`dp[v][白] = Π(dp[u][白] + dp[u][黒])` (白同士は隣合っても良い)  
v の子 u に対して総積をとる  

`dp[v][黒] = Π(dp[u][白])`  
v の子 u に対して総積をとる  

※0 => 白, 1 => 黒  

```cpp
ll N, u, v, dp[100009][2];
vi edges[100009];

void dfs(int x, int last = -1) {
    dp[x][0] = dp[x][1] = 1;
    for (auto to : edges[x]) {
        // 木を下る方向にしか注目していないので、登る方向の辺は continue する
        // この操作によって今回の木を DAG(有向非循環グラフ)として扱えるようになる
        if (to == last)
            continue;
        dfs(to, x);
        dp[x][0] = dp[x][0] * ((dp[to][0] + dp[to][1]) % MOD) % MOD;
        dp[x][1] = dp[x][1] * dp[to][0] % MOD;
    }
}

int main() {
    cin >> N;
    for (int i = 0; i < N - 1; i++) {
        cin >> u >> v;
        edges[u].push_back(v);
        edges[v].push_back(u);
    }
    dfs(1);
    cout << (dp[1][0] + dp[1][1]) % MOD << endl;
    return 0;
}
```


# 全方位木DP
木DPは「根を固定して（一つとして）」根に関する何らかの値をDPを利用して求めました（例：根から最も遠い点までの距離）。

これを、「それぞれの頂点を根として」すべての場合について根に関する何らかの値を求めたい時に用いるのが全方位木DP