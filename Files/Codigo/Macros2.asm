.macro Fin
	li $v0, 10
	syscall
.end_macro

.macro PintarPunto(%x, %color)
	add $t0, ,$zero , %x
	sll $t0, $t0, 2		#t0 << 2; -> t0*4
	li $t1, DIR_BASE
	add $t0, $t0, $t1	#DIR_BASE + OFFSET
	li $t1, %color
	sw $t1, 0($t0)
.end_macro 

.macro PintarPuntXY(%x, %y, %color)
	li $t0, %x
	li $t1, %y
	sll $t0, $t0, 2		#t0 << 2; -> t0*4
	sll $t1, $t1, 6		#t1 << 6; -> t1*64
	add $t1, $t1, $t0	#t1 += t0
	li $t0, DIR_BASE
	add $t0, $t0, $t1	#DIR_BASE + OFFSET
	li $t1, %color
	sw $t1, 0($t0)
.end_macro 

.macro PantallaBlanca
	add $t5,$zero,256
	beq $t7 ,$t5,continuar
	j pintarBlancoPantalla
.end_macro 



.macro PintarIcono

	PintarPuntXY(15,15,0x00FFFFFF)
	
	PintarPuntXY(14,15,0x00e6ffe6)
	PintarPuntXY(15,14,0x00e6ffe6)
	
	PintarPuntXY(13,15,0x00ccffcc)
	PintarPuntXY(14,14,0x00ccffcc)
	PintarPuntXY(15,13,0x00ccffcc)
	
	PintarPuntXY(12,15,0x00b3ffb3)
	PintarPuntXY(13,14,0x00b3ffb3)
	PintarPuntXY(14,13,0x00b3ffb3)
	PintarPuntXY(15,12,0x00b3ffb3)
	
	PintarPuntXY(12,14,0x0099ff99)
	PintarPuntXY(13,13,0x0099ff99)
	PintarPuntXY(14,12,0x0099ff99)
	
	PintarPuntXY(13,12,0x0080ff80)
	PintarPuntXY(12,13,0x0080ff80)
	
	PintarPuntXY(12,12,0x0066ff66)
	
	PintarPuntXY(11,11,0x004dff4d)
	
	PintarPuntXY(11,10,0x0033ff33)
	PintarPuntXY(10,11,0x0033ff33)
	
	PintarPuntXY(11,9,0x001aff1a)
	PintarPuntXY(10,10,0x001aff1a)
	PintarPuntXY(9,11,0x001aff1a)
	
	PintarPuntXY(11,8,0x0000ff00)
	PintarPuntXY(10,9,0x0000ff00)
	PintarPuntXY(9,10,0x0000ff00)
	PintarPuntXY(8,11,0x0000ff00)
	
	PintarPuntXY(11,7,0x0000e600)
	PintarPuntXY(10,8,0x0000e600)
	PintarPuntXY(9,9,0x0000e600)
	PintarPuntXY(8,10,0x0000e600)
	PintarPuntXY(7,11,0x0000e600)
	
	PintarPuntXY(11,6,0x0000cc00)
	PintarPuntXY(10,7,0x0000cc00)
	PintarPuntXY(9,8,0x0000cc00)
	PintarPuntXY(8,9,0x0000cc00)
	PintarPuntXY(7,10,0x0000cc00)
	PintarPuntXY(6,11,0x0000cc00)
	
	PintarPuntXY(11,5,0x0000b300)
	PintarPuntXY(10,6,0x0000b300)
	PintarPuntXY(9,7,0x0000b300)
	PintarPuntXY(8,8,0x0000b300)
	PintarPuntXY(7,9,0x0000b300)
	PintarPuntXY(6,10,0x0000b300)
	PintarPuntXY(5,11,0x0000b300)
	
	
	PintarPuntXY(11,4,0x00009900)
	PintarPuntXY(10,5,0x00009900)
	PintarPuntXY(9,6,0x00009900)
	PintarPuntXY(8,7,0x00009900)
	PintarPuntXY(7,8,0x00009900)
	PintarPuntXY(6,9,0x00009900)
	PintarPuntXY(5,10,0x00009900)
	PintarPuntXY(4,11,0x00009900)
	
	
	PintarPuntXY(10,4,0x00008000)
	PintarPuntXY(9,5,0x00008000)
	PintarPuntXY(8,6,0x00008000)
	PintarPuntXY(6,8,0x00008000)
	PintarPuntXY(5,9,0x00008000)
	PintarPuntXY(4,10,0x00008000)
	
	PintarPuntXY(9,4,0x00006600)
	PintarPuntXY(8,5,0x00006600)
	PintarPuntXY(5,8,0x00006600)
	PintarPuntXY(4,9,0x00006600)

	PintarPuntXY(8,4,0x00006600)
	PintarPuntXY(4,8,0x00006600)	
	
.end_macro 
