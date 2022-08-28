FROM continuumio/anaconda3:latest
# reproject の pip install に gcc が必要だったので
# apt install しておきます
RUN apt update && \
    apt install -y build-essential   

# 追加でインストールしたい python モジュール
RUN pip install jupyter-book && \
    pip install ghp-import

# ホスト PC の data フォルダへ繋ぐ入口です
RUN mkdir /book

# jupyter の起動パラメータを設定します
EXPOSE 8888
CMD ["jupyter", "lab", \
     "--port=8888", \
     "--ip=0.0.0.0", \
     "--allow-root", \
     "--no-browser", \
     "--NotebookApp.token=''"]

WORKDIR /root/book