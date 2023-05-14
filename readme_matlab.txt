readme プログラム

matlabを用いてシミュレーションを行った。
７つのファイルが存在するのでそれぞれ説明する。

tyouwa11g.mおよびtyouwa11b.mのファイルだが、これはIEEE802.11b、IEEE802.11gの距離と伝送レートの関係から調和平均に必要な1/b(bは伝送レート)を求めるためのプログラムである。
既にaverage_throughput_v4.mに適応させてるため直接的に使うことはない。

transition_plus_with_mutation.mおよびtransition_minus_with_mutation.mは確率進化ゲーム理論で用いる出生死滅過程を示しているものであり、それぞれUAVが1台増えるのと減るのを示している。
この二つのプログラムを用いて確率進化ゲーム理論の分布までを示しているのがdirect_stationary.mである。

direct_stationary.mを用いて確率進化ゲーム理論による分布をグラフ化したものがsteady_state_probability_v3.mである。誤り確率を0から0.5まで変動させその時の分布を表示させている。
AP1の定常分布を作るならdirect_stationary(N,1,4,1,1,2)にし、AP2の定常分布を作るならdirect_stationary(N,1,2,1,1,4)にしする。

direct_stationary.mを用いて平均スループットを導出したのがaverage_throughput_v4.mである。ここではAP毎に平均スループットを導出しそこから全体の平均スループットを導出している。
