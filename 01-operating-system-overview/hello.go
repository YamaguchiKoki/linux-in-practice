package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"runtime/trace"
)

func _main() {
	_, task := trace.NewTask(context.Background(), "main")
	defer task.End()

	fmt.Println("hello world")
}

func main() {
	f, err := os.Create("tseq.out")
	if err != nil {
		log.Fatalln("Error:", err)
	}
	defer func() {
		if err := f.Close(); err != nil {
			log.Fatalln("Error:", err)
		}
	}()

	if err := trace.Start(f); err != nil {
		log.Fatalln("Error:", err)
	}
	defer trace.Stop()

	_main()
}
