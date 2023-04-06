# ワーシャルフロイド法
全点対間の最短距離を求めるためのアルゴリズム。  
ワーシャルフロイド法は、負の辺が存在する場合でも正確に最短距離を求めることができるが、負の閉路が存在する場合は壊れてしまう。

ワーシャルフロイド法の計算量は$O(V^3)$。ただし、Vは頂点の数を表す。
```cpp
#define INF ((1 << 30) - 1)
int main() {
    int n, m;
    cin >> n >> m;
    vector<vector<int>> dist(n, vector<int>(n, INF));
    for (int i = 0; i < m; ++i) {
        int a, b, c;
        cin >> a >> b >> c;
        --a; --b;
        dist[a][b] = dist[b][a] = c;
    }
    for (int i = 0; i < n; ++i) dist[i][i] = 0;
    for (int k = 0; k < n; ++k) {
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);
            }
        }
    }
    return 0;
}

```
実装を見ると分かる通り、**動的計画法の一種**。
三重ループを使用してDPテーブルを更新する。つまり、DPテーブルの要素を更新するために、各頂点を経由する場合と経由しない場合の2つのパターンを試す