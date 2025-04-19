#!/bin/bash

cleanup() {
  echo "中断されました。クリーンアップしています..."
  exit 1
}

trap cleanup SIGINT SIGTERM

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Linux in Practice 用Dockerコンテナをセットアップします${NC}"

echo -e "${YELLOW}Dockerイメージをビルドしています...${NC}"
docker build -t linux-in-practice -f dockerfile .

echo -e "${YELLOW}コンテナを起動しています...${NC}"
docker run -it --privileged \
  --name linux-practice-container \
  -v $(pwd):/app \
  --rm \
  linux-in-practice

echo -e "${GREEN}完了しました${NC}"
