package main

import (
	"bufio"
	"os"
)

// buildして、otool -hでヘッダ情報見たり、バックグラウンド実行後vmmap{pid}でメモリマッピングを見たり
func main() {
	bufio.NewScanner(os.Stdin).Scan();
}
