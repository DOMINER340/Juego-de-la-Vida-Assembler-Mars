	.eqv DIR_BASE		0x10000000
	.eqv AZUL		0x000000FF
	.eqv BLANCO		0x00FFFFFF
	.eqv NEGRO		0x00000000
	.include "Macros2.asm"	
	
	.data
espacio:.space  257
espacio2:.space  257  
decision:.space  2
prueba: .asciiz "llego la prueba"
archivo:.asciiz "matriz_inicial.txt"
Bienvenida:.asciiz "Bienvenido, presione aceptar para continuar"
error:.asciiz "Por favor ingrese una opcion valida"
salir:.asciiz "Gracias por utilizar nuestra aplicacion"
inicio:.asciiz "Presione I para iniciar o S para salir"
i:.ascii "i"
s:.ascii "s"
uno:.ascii "1"
cero:.ascii "0"

	.text
main: 
	# $s0__________  save the file descriptor
	lb  $s7,uno #s7 guarda 1
 	lb  $s6,cero #s6 guarda 0
 	lb $s5, i #s5 guarda "i"
	lb $s4, s #s4 guarda "s"
	
 	# $s0 save the file descriptor
	
	#se pinta el icono de inicio
	PintarIcono 
	
	#Imprimir mensaje y usuario debe aceptar
	li $v0, 55	#Código de servicio para imprimir un mensaje y espera de aceptar
	la $a0, Bienvenida
	add $a1, $zero, 1
	syscall
	j abrirArchivo
	
abrirArchivo: 
	
	#abrir el archivo
	li $v0, 13	#Código de servicio para abrir un archivo
	la $a0, archivo
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0 	# save the file descriptor
	
	#Leer desde una archivo
	li $v0, 14	#Código de servicio para leer desde un archivo
	move $a0, $s0
	la $a1, espacio
	li $a2, 256
	syscall
	
	add $t7,$zero,$zero
	PantallaBlanca
	
#continua
continuar: 			
	#Imprimir la cadena de texto, caracter por caracter
	la $s2, espacio
	add $t7,$zero,$zero
bucle:
	lb $s1, 0($s2)
	beqz $s1, continuar2
	
	li $v0, 11	#Código de servicio para imprimir un caracter
	add $a0, $zero, $s1
	syscall
	
	
	addi $s2, $s2, 1
	jal guardado
	beq $a0,$s7,pintarAzul
	beq $a0,$s6,pintarBlanco
	j bucle

continuar2:	
	#Imprimir mensaje y usuario debe aceptar
	li $v0, 54	#Código de servicio para imprimir un mensaje y espera de aceptar
	la $a0, inicio
	la $a1,decision
	add $a2, $zero, 2
	syscall

	la $s3,decision
	lb $s3, 0($s3)
	beq $s3,$s4,fin
	beq $s3,$s5,llegue
	bne $s3,$s5,avisar


	
pintarAzul: 
	PintarPunto($t7,AZUL)
	add $t7, $t7,1
	la $t6, 4($t6)
	jr $t6

pintarBlanco: 
	PintarPunto($t7,BLANCO)
	add $t7, $t7, 1
	la $t6, 4($t6)
	j bucle
	
guardado: 
	add $t6,$zero,$ra
	jr $t6
	
fin:
	#Imprimir mensaje y usuario debe aceptar
	li $v0, 55	#Código de servicio para imprimir un mensaje y espera de aceptar
	la $a0, salir
	add $a2, $zero, 1
	syscall
	Fin
	
pintarBlancoPantalla:
	PintarPunto($t7,0x00FFFFFF)
	add $t7,$t7,1
	PantallaBlanca
	
avisar: 
	#Imprimir mensaje y usuario debe aceptar
	li $v0, 55	#Código de servicio para imprimir un mensaje y espera de aceptar
	la $a0, error
	add $a2, $zero, 1
	syscall
	j continuar2
	
	
llegue: 
	#Imprimir mensaje y usuario debe aceptar
	li $v0, 55	#Código de servicio para imprimir un mensaje y espera de aceptar
	la $a0, prueba
	add $a2, $zero, 1
	syscall
	
	#Imprimir la cadena de texto, caracter por caracter
	la $t0, espacio
	add $t7,$zero,$zero
	add $t5,$zero,$zero
	la $t2, espacio2
	j fin


bucleM:
	lb $t1, 0($t0)
	beqz $t1, fin
	li $v0, 11	#Código de servicio para imprimir un caracter
	add $a0, $zero, $t1
	syscall
	addi $t0, $t0, 1
	addi $t7,$t7,1
	add $t4,$zero,1
	
	beq $t7,0,primero
	
	sb  $t4,0($t0)
	

	
	
	#Imprimir un caracter
	li $v0, 11	#Código de servicio para imprimir un caracter
	add $a0, $zero, $t4
	syscall
	
	j bucleM
	
primero: 
	la $t3,1($t0)
	jal guardado
	beq $t3,$s7,suma	
	
	la $t3,16($t0)
	jal guardado
	beq $t3,$s7,suma
	
	la $t3,17($t0)
	jal guardado
	beq $t3,$s7,suma

	beq $t5,3,prender
	
suma: 
	la $t6, 4($t6)
	add $t5, $t5,1
	jr $t6
	
prender:
	sb  $t4,0($t0)
	lb $t4,0($t0)
	
	j llegue

arriba: j fin
	
