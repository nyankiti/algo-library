# bit DP
## 巡回セールスマン問題
`dp[i][j]` : 既に訪問した都市集合が i であり、現在位置が j である時の、現時点での最小移動距離
```cpp
/* macro */
#define rep(i, a, n) for (int i = (a); i < (n); ++i)

double calc_dist(int xj, int yj, int xk, int yk) {
  return sqrt(1.0 * (xj - xk) * (xj - xk) + 1.0 * (yj - yk) * (yj - yk));
}

int N, X[1009], Y[1009];
// dp[i][j] => 訪問した都市集合が i で現在位置が j である時の最小移動距離
double dp[1 << 16][19];
int main() {
  cin >> N;
  rep(i, 0, N) cin >> X[i] >> Y[i];
  // dpの初期化
  rep(i, 0, 1 << N) rep(j, 0, N) dp[i][j] = 1e9;
  dp[0][0] = 0;
  rep(i, 0, 1 << N) {
    rep(j, 0, N) {
      // 未訪問の都市からは遷移を考えられないのでcontinueする
      if (dp[i][j] >= 1e9) continue;

      // 都市 j から 都市 k への遷移を考える
      rep(k, 0, N) {
        // 既に都市 k を訪問している場合
        if ((i / (1 << k)) % 2 == 1) continue;

        double DIST = calc_dist(X[j], Y[j], X[k], Y[k]);

        // 都市 k へ遷移
        dp[i + (1 << k)][k] = min(dp[i + (1 << k)][k], dp[i][j] + DIST);
      }
    }
  }
  printf("%.12lf\n", dp[(1 << N) - 1][0]);
  return 0;
}
```