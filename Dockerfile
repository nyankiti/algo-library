FROM continuumio/anaconda3:latest
# reproject の pip install に gcc が必要だったので
# apt install しておきます
RUN apt update && \
    apt install -y build-essential   

# jupyter bookの追加
RUN pip install jupyter-book

# jupyter の起動パラメータを設定します
EXPOSE 8888
CMD ["jupyter", "lab", \
     "--port=8888", \
     "--ip=0.0.0.0", \
     "--allow-root", \
     "--no-browser", \
     "--NotebookApp.token=''"]
