begin_build:	
	echo " DEBUG build start ->"
	ca65 src/main.asm -g -o build/main.o
	ca65 ./data/stage1_data.asm -g -o build/stage1_data.o
	ca65 ./data/stage2_data.asm -g -o build/stage2_data.o
	ca65 ./data/stage3_data.asm -g -o build/stage3_data.o
	ld65 -o output.nes -C ld65.cfg build/main.o build/stage1_data.o build/stage2_data.o build/stage3_data.o --dbgfile build/output.dbg
	ld65 -C ld65.cfg -o output.nes build/main.o build/stage1_data.o build/stage2_data.o build/stage3_data.o --mapfile build/output.map
	echo "------- DEBUG build S-U-C-C-E-S-S.-------"