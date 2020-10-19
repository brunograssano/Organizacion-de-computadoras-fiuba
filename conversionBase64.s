	.file	1 "conversionBase64.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.globl	CANTIDAD_MINIMA_ARGUMENTOS
	.rdata
	.align	2
	.type	CANTIDAD_MINIMA_ARGUMENTOS, @object
	.size	CANTIDAD_MINIMA_ARGUMENTOS, 4
CANTIDAD_MINIMA_ARGUMENTOS:
	.word	1
	.globl	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR
	.align	2
	.type	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR, @object
	.size	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR, 4
CANTIDAD_ARGUMENTOS_PARA_CODIFICAR:
	.word	5
	.globl	CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR
	.align	2
	.type	CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR, @object
	.size	CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR, 4
CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR:
	.word	6
	.globl	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR
	.align	2
	.type	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR, @object
	.size	CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR, 4
CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR:
	.word	3
	.globl	POS_ARCHIVO_INPUT_ENCODE
	.align	2
	.type	POS_ARCHIVO_INPUT_ENCODE, @object
	.size	POS_ARCHIVO_INPUT_ENCODE, 4
POS_ARCHIVO_INPUT_ENCODE:
	.word	2
	.globl	POS_COMANDO_OUTPUT_ENCODE
	.align	2
	.type	POS_COMANDO_OUTPUT_ENCODE, @object
	.size	POS_COMANDO_OUTPUT_ENCODE, 4
POS_COMANDO_OUTPUT_ENCODE:
	.word	3
	.globl	POS_ARCHIVO_OUTPUT_ENCODE
	.align	2
	.type	POS_ARCHIVO_OUTPUT_ENCODE, @object
	.size	POS_ARCHIVO_OUTPUT_ENCODE, 4
POS_ARCHIVO_OUTPUT_ENCODE:
	.word	4
	.globl	POS_ARCHIVO_INPUT_DECODE
	.align	2
	.type	POS_ARCHIVO_INPUT_DECODE, @object
	.size	POS_ARCHIVO_INPUT_DECODE, 4
POS_ARCHIVO_INPUT_DECODE:
	.word	3
	.globl	POS_COMANDO_OUTPUT_DECODE
	.align	2
	.type	POS_COMANDO_OUTPUT_DECODE, @object
	.size	POS_COMANDO_OUTPUT_DECODE, 4
POS_COMANDO_OUTPUT_DECODE:
	.word	4
	.globl	POS_ARCHIVO_OUTPUT_DECODE
	.align	2
	.type	POS_ARCHIVO_OUTPUT_DECODE, @object
	.size	POS_ARCHIVO_OUTPUT_DECODE, 4
POS_ARCHIVO_OUTPUT_DECODE:
	.word	5
	.globl	ARCHIVO_VACIO
	.align	2
	.type	ARCHIVO_VACIO, @object
	.size	ARCHIVO_VACIO, 4
ARCHIVO_VACIO:
	.space	4
	.globl	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL
	.align	2
	.type	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL, @object
	.size	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL, 4
LARGO_MAXIMO_ARCHIVO_POR_TERMINAL:
	.word	1000
	.align	2
$LC1:
	.ascii	"Uso: \000"
	.align	2
$LC2:
	.ascii	" tp0 -h\000"
	.align	2
$LC3:
	.ascii	" tp0 -V\000"
	.align	2
$LC4:
	.ascii	" tp0 [opciones]\000"
	.align	2
$LC5:
	.ascii	"Opciones: \000"
	.align	2
$LC6:
	.ascii	" -V, --version    Imprime la version y termina el progra"
	.ascii	"ma.\000"
	.align	2
$LC7:
	.ascii	" -h, --help       Imprime esta informacion.\000"
	.align	2
$LC8:
	.ascii	" -o, --output     Indica que le sigue la direccion al ar"
	.ascii	"chivo de salida.\000"
	.align	2
$LC9:
	.ascii	" -i, --input      Indica que le sigue la direccion al ar"
	.ascii	"chivo de entrada.\000"
	.align	2
$LC10:
	.ascii	" -d, --decode     Decodifica un archivo codificado en ba"
	.ascii	"se 64 .\000"
	.align	2
$LC11:
	.ascii	"Ejemplos: \000"
	.align	2
$LC12:
	.ascii	"\011tp0 -i input.txt -o output.txt\000"
	.align	2
$LC13:
	.ascii	"\011tp0 -d -i inputInBase64.txt -o outputInText.txt\000"
	.align	2
$LC14:
	.ascii	"\011cat input.txt | ./tp0  (Unicamente para codificar)\000"
	.text
	.align	2
	.globl	imprimirAyuda
	.set	nomips16
	.set	nomicromips
	.ent	imprimirAyuda
	.type	imprimirAyuda, @function
imprimirAyuda:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC2)($28)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC3)($28)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC4)($28)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC5)($28)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC6)($28)
	addiu	$4,$2,%lo($LC6)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC7)($28)
	addiu	$4,$2,%lo($LC7)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC8)($28)
	addiu	$4,$2,%lo($LC8)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC9)($28)
	addiu	$4,$2,%lo($LC9)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC10)($28)
	addiu	$4,$2,%lo($LC10)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC11)($28)
	addiu	$4,$2,%lo($LC11)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC12)($28)
	addiu	$4,$2,%lo($LC12)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC13)($28)
	addiu	$4,$2,%lo($LC13)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC14)($28)
	addiu	$4,$2,%lo($LC14)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	imprimirAyuda
	.size	imprimirAyuda, .-imprimirAyuda
	.rdata
	.align	2
$LC15:
	.ascii	"Version 0.0.1\000"
	.text
	.align	2
	.globl	mostrarVersion
	.set	nomips16
	.set	nomicromips
	.ent	mostrarVersion
	.type	mostrarVersion, @function
mostrarVersion:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC15)($28)
	addiu	$4,$2,%lo($LC15)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	mostrarVersion
	.size	mostrarVersion, .-mostrarVersion
	.align	2
	.globl	esMultiploDeTres
	.set	nomips16
	.set	nomicromips
	.ent	esMultiploDeTres
	.type	esMultiploDeTres, @function
esMultiploDeTres:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$4,8($fp)
	li	$2,1431633920			# 0x55550000
	ori	$2,$2,0x5556
	mult	$4,$2
	mfhi	$3
	sra	$2,$4,31
	subu	$3,$3,$2
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	subu	$3,$4,$2
	sltu	$2,$3,1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	esMultiploDeTres
	.size	esMultiploDeTres, .-esMultiploDeTres
	.align	2
	.globl	calcularTamanioArchivoSalidaBase64
	.set	nomips16
	.set	nomicromips
	.ent	calcularTamanioArchivoSalidaBase64
	.type	calcularTamanioArchivoSalidaBase64, @function
calcularTamanioArchivoSalidaBase64:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$2,40($fp)
	sw	$2,24($fp)
	lw	$4,40($fp)
	lw	$2,%got(esMultiploDeTres)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,esMultiploDeTres
1:	jalr	$25
	nop

	lw	$28,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L6
	nop

	lw	$4,40($fp)
	li	$2,1431633920			# 0x55550000
	ori	$2,$2,0x5556
	mult	$4,$2
	mfhi	$3
	sra	$2,$4,31
	subu	$3,$3,$2
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	subu	$3,$4,$2
	li	$2,3			# 0x3
	subu	$2,$2,$3
	lw	$3,24($fp)
	addu	$2,$3,$2
	sw	$2,24($fp)
$L6:
	lw	$2,24($fp)
	li	$3,1431633920			# 0x55550000
	ori	$3,$3,0x5556
	mult	$2,$3
	mfhi	$3
	sra	$2,$2,31
	subu	$2,$3,$2
	sw	$2,24($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	sw	$2,24($fp)
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	calcularTamanioArchivoSalidaBase64
	.size	calcularTamanioArchivoSalidaBase64, .-calcularTamanioArchivoSalidaBase64
	.align	2
	.globl	adicionarCaracteresAlFinalDeLaSecuencia
	.set	nomips16
	.set	nomicromips
	.ent	adicionarCaracteresAlFinalDeLaSecuencia
	.type	adicionarCaracteresAlFinalDeLaSecuencia, @function
adicionarCaracteresAlFinalDeLaSecuencia:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	sw	$6,16($fp)
	sw	$7,20($fp)
	lw	$2,16($fp)
	addiu	$3,$2,1
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L9
	nop

	lw	$2,20($fp)
	addiu	$2,$2,2
	lw	$3,24($fp)
	addu	$2,$3,$2
	lw	$3,12($fp)
	sra	$3,$3,6
	andi	$3,$3,0x3f
	lw	$4,8($fp)
	addu	$3,$4,$3
	lb	$3,0($3)
	sb	$3,0($2)
	b	$L10
	nop

$L9:
	lw	$2,20($fp)
	addiu	$2,$2,2
	lw	$3,24($fp)
	addu	$2,$3,$2
	li	$3,61			# 0x3d
	sb	$3,0($2)
$L10:
	lw	$2,16($fp)
	addiu	$3,$2,2
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L11
	nop

	lw	$2,20($fp)
	addiu	$2,$2,3
	lw	$3,24($fp)
	addu	$2,$3,$2
	lw	$3,12($fp)
	andi	$3,$3,0x3f
	lw	$4,8($fp)
	addu	$3,$4,$3
	lb	$3,0($3)
	sb	$3,0($2)
	b	$L13
	nop

$L11:
	lw	$2,20($fp)
	addiu	$2,$2,3
	lw	$3,24($fp)
	addu	$2,$3,$2
	li	$3,61			# 0x3d
	sb	$3,0($2)
$L13:
	nop
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	adicionarCaracteresAlFinalDeLaSecuencia
	.size	adicionarCaracteresAlFinalDeLaSecuencia, .-adicionarCaracteresAlFinalDeLaSecuencia
	.rdata
	.align	2
$LC16:
	.ascii	"El archivo esta vacio, no hay nada para codificar.\000"
	.align	2
$LC17:
	.ascii	"Ha ocurrido un error durante la codificacion.\000"
	.align	2
$LC18:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
	.ascii	"456789+/\000"
	.text
	.align	2
	.globl	codificarTexto
	.set	nomips16
	.set	nomicromips
	.ent	codificarTexto
	.type	codificarTexto, @function
codificarTexto:
	.frame	$fp,128,$31		# vars= 88, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-128
	sw	$31,124($sp)
	sw	$fp,120($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$4,128($fp)
	sw	$5,132($fp)
	move	$3,$0
	lw	$2,132($fp)
	bne	$2,$3,$L15
	nop

	lw	$2,%got($LC16)($28)
	addiu	$4,$2,%lo($LC16)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,24($fp)
	move	$2,$0
	b	$L24
	nop

$L15:
	lw	$4,132($fp)
	lw	$2,%got(calcularTamanioArchivoSalidaBase64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,calcularTamanioArchivoSalidaBase64
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,40($fp)
	lw	$2,40($fp)
	addiu	$2,$2,1
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,44($fp)
	lw	$2,44($fp)
	bne	$2,$0,$L17
	nop

	lw	$2,%got($LC17)($28)
	addiu	$4,$2,%lo($LC17)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,24($fp)
	move	$2,$0
	b	$L24
	nop

$L17:
	lw	$2,%got($LC18)($28)
	addiu	$3,$fp,52
	addiu	$2,$2,%lo($LC18)
	li	$4,65			# 0x41
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lw	$2,40($fp)
	lw	$3,44($fp)
	addu	$2,$3,$2
	sb	$0,0($2)
	sw	$0,32($fp)
	sw	$0,36($fp)
	b	$L18
	nop

$L23:
	lw	$2,32($fp)
	lw	$3,128($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	sw	$2,48($fp)
	lw	$2,32($fp)
	addiu	$3,$2,1
	lw	$2,132($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L19
	nop

	lw	$2,48($fp)
	sll	$2,$2,8
	lw	$3,32($fp)
	addiu	$3,$3,1
	lw	$4,128($fp)
	addu	$3,$4,$3
	lbu	$3,0($3)
	or	$2,$2,$3
	b	$L20
	nop

$L19:
	lw	$2,48($fp)
	sll	$2,$2,8
$L20:
	sw	$2,48($fp)
	lw	$2,32($fp)
	addiu	$3,$2,2
	lw	$2,132($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L21
	nop

	lw	$2,48($fp)
	sll	$2,$2,8
	lw	$3,32($fp)
	addiu	$3,$3,2
	lw	$4,128($fp)
	addu	$3,$4,$3
	lbu	$3,0($3)
	or	$2,$2,$3
	b	$L22
	nop

$L21:
	lw	$2,48($fp)
	sll	$2,$2,8
$L22:
	sw	$2,48($fp)
	lw	$2,36($fp)
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$3,48($fp)
	sra	$3,$3,18
	andi	$3,$3,0x3f
	addiu	$4,$fp,32
	addu	$3,$4,$3
	lb	$3,20($3)
	sb	$3,0($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$3,48($fp)
	sra	$3,$3,12
	andi	$3,$3,0x3f
	addiu	$4,$fp,32
	addu	$3,$4,$3
	lb	$3,20($3)
	sb	$3,0($2)
	addiu	$3,$fp,52
	lw	$2,132($fp)
	sw	$2,20($sp)
	lw	$2,44($fp)
	sw	$2,16($sp)
	lw	$7,36($fp)
	lw	$6,32($fp)
	lw	$5,48($fp)
	move	$4,$3
	lw	$2,%got(adicionarCaracteresAlFinalDeLaSecuencia)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,adicionarCaracteresAlFinalDeLaSecuencia
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lw	$2,32($fp)
	addiu	$2,$2,3
	sw	$2,32($fp)
	lw	$2,36($fp)
	addiu	$2,$2,4
	sw	$2,36($fp)
$L18:
	lw	$2,132($fp)
	addiu	$3,$2,-1
	lw	$2,32($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L23
	nop

	lw	$2,44($fp)
$L24:
	move	$sp,$fp
	lw	$31,124($sp)
	lw	$fp,120($sp)
	addiu	$sp,$sp,128
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	codificarTexto
	.size	codificarTexto, .-codificarTexto
	.align	2
	.globl	obtenerTextoCodificado
	.set	nomips16
	.set	nomicromips
	.ent	obtenerTextoCodificado
	.type	obtenerTextoCodificado, @function
obtenerTextoCodificado:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	li	$6,2			# 0x2
	move	$5,$0
	lw	$4,48($fp)
	lw	$2,%call16(fseek)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fseek
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,48($fp)
	lw	$2,%call16(ftell)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,ftell
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	move	$6,$0
	move	$5,$0
	lw	$4,48($fp)
	lw	$2,%call16(fseek)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fseek
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L26
	nop

	lw	$2,%got($LC17)($28)
	addiu	$4,$2,%lo($LC17)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L27
	nop

$L26:
	lw	$2,24($fp)
	lw	$7,48($fp)
	move	$6,$2
	li	$5,1			# 0x1
	lw	$4,28($fp)
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$5,24($fp)
	lw	$4,28($fp)
	lw	$2,%got(codificarTexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificarTexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$4,28($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
$L27:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	obtenerTextoCodificado
	.size	obtenerTextoCodificado, .-obtenerTextoCodificado
	.align	2
	.globl	hacerConversionABase64
	.set	nomips16
	.set	nomicromips
	.ent	hacerConversionABase64
	.type	hacerConversionABase64, @function
hacerConversionABase64:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$4,40($fp)
	lw	$2,%got(obtenerTextoCodificado)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,obtenerTextoCodificado
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	beq	$2,$0,$L31
	nop

	lw	$5,44($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fputs)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputs
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L28
	nop

$L31:
	nop
$L28:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	hacerConversionABase64
	.size	hacerConversionABase64, .-hacerConversionABase64
	.rdata
	.align	2
$LC19:
	.ascii	"-o\000"
	.align	2
$LC20:
	.ascii	"r\000"
	.align	2
$LC21:
	.ascii	"El archivo ingresado para codificar no existe.\000"
	.align	2
$LC22:
	.ascii	"w\000"
	.align	2
$LC23:
	.ascii	"Hubo un error al crear el archivo de salida.\000"
	.align	2
$LC24:
	.ascii	"Faltan argumentos para poder codificar. Se muestra ayuda"
	.ascii	".\000"
	.align	2
$LC25:
	.ascii	"Se mandaron argumentos de mas. Se muestra ayuda.\000"
	.text
	.align	2
	.globl	convertirABase64
	.set	nomips16
	.set	nomicromips
	.ent	convertirABase64
	.type	convertirABase64, @function
convertirABase64:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	li	$2,5			# 0x5
	lw	$3,48($fp)
	bne	$3,$2,$L33
	nop

	li	$2,3			# 0x3
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC19)($28)
	addiu	$5,$2,%lo($LC19)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L33
	nop

	li	$2,2			# 0x2
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L34
	nop

	lw	$2,%got($LC21)($28)
	addiu	$4,$2,%lo($LC21)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L34:
	li	$2,4			# 0x4
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L36
	nop

	lw	$2,%got($LC23)($28)
	addiu	$4,$2,%lo($LC23)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L36:
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(hacerConversionABase64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,hacerConversionABase64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L33:
	li	$2,3			# 0x3
	lw	$3,48($fp)
	bne	$3,$2,$L37
	nop

	li	$2,2			# 0x2
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$2,32($fp)
	bne	$2,$0,$L38
	nop

	lw	$2,%got($LC21)($28)
	addiu	$4,$2,%lo($LC21)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L38:
	lw	$4,32($fp)
	lw	$2,%got(obtenerTextoCodificado)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,obtenerTextoCodificado
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	bne	$2,$0,$L39
	nop

	lw	$4,32($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L39:
	lw	$4,36($fp)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,32($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,36($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L32
	nop

$L37:
	li	$2,5			# 0x5
	lw	$3,48($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L40
	nop

	lw	$2,%got($LC24)($28)
	addiu	$4,$2,%lo($LC24)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L41
	nop

$L40:
	lw	$2,%got($LC25)($28)
	addiu	$4,$2,%lo($LC25)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L41:
	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L32:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	convertirABase64
	.size	convertirABase64, .-convertirABase64
	.align	2
	.globl	calcularTamanioArchivoSalidaDeTexto
	.set	nomips16
	.set	nomicromips
	.ent	calcularTamanioArchivoSalidaDeTexto
	.type	calcularTamanioArchivoSalidaDeTexto, @function
calcularTamanioArchivoSalidaDeTexto:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$2,36($fp)
	sw	$2,8($fp)
	lw	$2,8($fp)
	bgez	$2,$L43
	nop

	addiu	$2,$2,3
$L43:
	sra	$2,$2,2
	sw	$2,8($fp)
	lw	$3,8($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sw	$2,8($fp)
	lw	$2,8($fp)
	sw	$2,12($fp)
	sb	$0,16($fp)
	b	$L44
	nop

$L48:
	lw	$2,12($fp)
	lw	$3,32($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L45
	nop

	lw	$2,8($fp)
	addiu	$2,$2,-1
	sw	$2,8($fp)
	b	$L46
	nop

$L45:
	li	$2,1			# 0x1
	sb	$2,16($fp)
$L46:
	lw	$2,12($fp)
	addiu	$2,$2,-1
	sw	$2,12($fp)
$L44:
	lw	$2,12($fp)
	blez	$2,$L47
	nop

	lbu	$2,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	bne	$2,$0,$L48
	nop

$L47:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	calcularTamanioArchivoSalidaDeTexto
	.size	calcularTamanioArchivoSalidaDeTexto, .-calcularTamanioArchivoSalidaDeTexto
	.align	2
	.globl	esCaracterValido
	.set	nomips16
	.set	nomicromips
	.ent	esCaracterValido
	.type	esCaracterValido, @function
esCaracterValido:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	move	$2,$4
	sb	$2,8($fp)
	lb	$2,8($fp)
	slt	$2,$2,48
	bne	$2,$0,$L51
	nop

	lb	$2,8($fp)
	slt	$2,$2,58
	bne	$2,$0,$L52
	nop

$L51:
	lb	$2,8($fp)
	slt	$2,$2,65
	bne	$2,$0,$L53
	nop

	lb	$2,8($fp)
	slt	$2,$2,91
	bne	$2,$0,$L52
	nop

$L53:
	lb	$2,8($fp)
	slt	$2,$2,97
	bne	$2,$0,$L54
	nop

	lb	$2,8($fp)
	slt	$2,$2,123
	bne	$2,$0,$L52
	nop

$L54:
	lb	$3,8($fp)
	li	$2,43			# 0x2b
	beq	$3,$2,$L52
	nop

	lb	$3,8($fp)
	li	$2,47			# 0x2f
	beq	$3,$2,$L52
	nop

	lb	$3,8($fp)
	li	$2,61			# 0x3d
	bne	$3,$2,$L55
	nop

$L52:
	li	$2,1			# 0x1
	b	$L56
	nop

$L55:
	move	$2,$0
$L56:
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	esCaracterValido
	.size	esCaracterValido, .-esCaracterValido
	.rdata
	.align	2
$LC26:
	.ascii	"El archivo esta vacio, no hay nada para decodificar.\000"
	.align	2
$LC27:
	.ascii	"El archivo enviado no esta en base 64.\000"
	.align	2
$LC28:
	.ascii	"Ha ocurrido un error durante la decodificacion.\000"
	.align	2
$LC0:
	.word	62
	.word	-1
	.word	-1
	.word	-1
	.word	63
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.text
	.align	2
	.globl	decodificarBase64ATexto
	.set	nomips16
	.set	nomicromips
	.ent	decodificarBase64ATexto
	.type	decodificarBase64ATexto, @function
decodificarBase64ATexto:
	.frame	$fp,376,$31		# vars= 344, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-376
	sw	$31,372($sp)
	sw	$fp,368($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,376($fp)
	sw	$5,380($fp)
	move	$3,$0
	lw	$2,380($fp)
	bne	$2,$3,$L59
	nop

	lw	$2,%got($LC26)($28)
	addiu	$4,$2,%lo($LC26)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L74
	nop

$L59:
	lw	$2,380($fp)
	andi	$2,$2,0x3
	beq	$2,$0,$L61
	nop

	lw	$2,%got($LC27)($28)
	addiu	$4,$2,%lo($LC27)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L74
	nop

$L61:
	sw	$0,24($fp)
	b	$L62
	nop

$L64:
	lw	$2,24($fp)
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	seb	$2,$2
	move	$4,$2
	lw	$2,%got(esCaracterValido)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,esCaracterValido
1:	jalr	$25
	nop

	lw	$28,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L63
	nop

	lw	$2,%got($LC27)($28)
	addiu	$4,$2,%lo($LC27)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L74
	nop

$L63:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L62:
	lw	$3,24($fp)
	lw	$2,380($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L64
	nop

	lw	$5,380($fp)
	lw	$4,376($fp)
	lw	$2,%got(calcularTamanioArchivoSalidaDeTexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,calcularTamanioArchivoSalidaDeTexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	addiu	$2,$2,1
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,40($fp)
	lw	$2,40($fp)
	bne	$2,$0,$L65
	nop

	lw	$2,%got($LC28)($28)
	addiu	$4,$2,%lo($LC28)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L74
	nop

$L65:
	lw	$2,%got($LC0)($28)
	addiu	$3,$fp,48
	addiu	$2,$2,%lo($LC0)
	li	$4,320			# 0x140
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,28($fp)
	sw	$0,32($fp)
	b	$L66
	nop

$L73:
	lw	$2,28($fp)
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$2,0($2)
	addiu	$2,$2,-43
	sll	$2,$2,2
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lw	$2,24($2)
	sw	$2,44($fp)
	lw	$2,44($fp)
	sll	$3,$2,6
	lw	$2,28($fp)
	addiu	$2,$2,1
	lw	$4,376($fp)
	addu	$2,$4,$2
	lbu	$2,0($2)
	addiu	$2,$2,-43
	sll	$2,$2,2
	addiu	$4,$fp,24
	addu	$2,$4,$2
	lw	$2,24($2)
	or	$2,$3,$2
	sw	$2,44($fp)
	lw	$2,28($fp)
	addiu	$2,$2,2
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L67
	nop

	lw	$2,44($fp)
	sll	$2,$2,6
	b	$L68
	nop

$L67:
	lw	$2,44($fp)
	sll	$3,$2,6
	lw	$2,28($fp)
	addiu	$2,$2,2
	lw	$4,376($fp)
	addu	$2,$4,$2
	lbu	$2,0($2)
	addiu	$2,$2,-43
	sll	$2,$2,2
	addiu	$4,$fp,24
	addu	$2,$4,$2
	lw	$2,24($2)
	or	$2,$3,$2
$L68:
	sw	$2,44($fp)
	lw	$2,28($fp)
	addiu	$2,$2,3
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L69
	nop

	lw	$2,44($fp)
	sll	$2,$2,6
	b	$L70
	nop

$L69:
	lw	$2,44($fp)
	sll	$3,$2,6
	lw	$2,28($fp)
	addiu	$2,$2,3
	lw	$4,376($fp)
	addu	$2,$4,$2
	lbu	$2,0($2)
	addiu	$2,$2,-43
	sll	$2,$2,2
	addiu	$4,$fp,24
	addu	$2,$4,$2
	lw	$2,24($2)
	or	$2,$3,$2
$L70:
	sw	$2,44($fp)
	lw	$2,32($fp)
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$3,44($fp)
	sra	$3,$3,16
	seb	$3,$3
	sb	$3,0($2)
	lw	$2,28($fp)
	addiu	$2,$2,2
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	beq	$3,$2,$L71
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$3,44($fp)
	sra	$3,$3,8
	seb	$3,$3
	sb	$3,0($2)
$L71:
	lw	$2,28($fp)
	addiu	$2,$2,3
	lw	$3,376($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	beq	$3,$2,$L72
	nop

	lw	$2,32($fp)
	addiu	$2,$2,2
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$3,44($fp)
	seb	$3,$3
	sb	$3,0($2)
$L72:
	lw	$2,28($fp)
	addiu	$2,$2,4
	sw	$2,28($fp)
	lw	$2,32($fp)
	addiu	$2,$2,3
	sw	$2,32($fp)
$L66:
	lw	$3,28($fp)
	lw	$2,380($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L73
	nop

	lw	$2,40($fp)
$L74:
	move	$sp,$fp
	lw	$31,372($sp)
	lw	$fp,368($sp)
	addiu	$sp,$sp,376
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	decodificarBase64ATexto
	.size	decodificarBase64ATexto, .-decodificarBase64ATexto
	.align	2
	.globl	hacerConversionATexto
	.set	nomips16
	.set	nomicromips
	.ent	hacerConversionATexto
	.type	hacerConversionATexto, @function
hacerConversionATexto:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	li	$6,2			# 0x2
	move	$5,$0
	lw	$4,48($fp)
	lw	$2,%call16(fseek)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fseek
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,48($fp)
	lw	$2,%call16(ftell)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,ftell
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	move	$6,$0
	move	$5,$0
	lw	$4,48($fp)
	lw	$2,%call16(fseek)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fseek
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L76
	nop

	lw	$2,%got($LC28)($28)
	addiu	$4,$2,%lo($LC28)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L75
	nop

$L76:
	lw	$2,24($fp)
	lw	$7,48($fp)
	move	$6,$2
	li	$5,1			# 0x1
	lw	$4,28($fp)
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$5,24($fp)
	lw	$4,28($fp)
	lw	$2,%got(decodificarBase64ATexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificarBase64ATexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lw	$2,32($fp)
	bne	$2,$0,$L78
	nop

	lw	$4,28($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L75
	nop

$L78:
	lw	$5,52($fp)
	lw	$4,32($fp)
	lw	$2,%call16(fputs)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputs
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,28($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,32($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L75:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	hacerConversionATexto
	.size	hacerConversionATexto, .-hacerConversionATexto
	.rdata
	.align	2
$LC29:
	.ascii	"El archivo ingresado para decodificar no existe.\000"
	.align	2
$LC30:
	.ascii	"Faltan argumentos para poder decodificar. Se muestra ayu"
	.ascii	"da.\000"
	.text
	.align	2
	.globl	decodificarATexto
	.set	nomips16
	.set	nomicromips
	.ent	decodificarATexto
	.type	decodificarATexto, @function
decodificarATexto:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	li	$2,6			# 0x6
	lw	$3,40($fp)
	bne	$3,$2,$L80
	nop

	li	$2,4			# 0x4
	sll	$2,$2,2
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC19)($28)
	addiu	$5,$2,%lo($LC19)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L80
	nop

	li	$2,3			# 0x3
	sll	$2,$2,2
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L81
	nop

	lw	$2,%got($LC29)($28)
	addiu	$4,$2,%lo($LC29)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L79
	nop

$L81:
	li	$2,5			# 0x5
	sll	$2,$2,2
	lw	$3,44($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L83
	nop

	lw	$2,%got($LC23)($28)
	addiu	$4,$2,%lo($LC23)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L79
	nop

$L83:
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(hacerConversionATexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,hacerConversionATexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L79
	nop

$L80:
	li	$2,6			# 0x6
	lw	$3,40($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L84
	nop

	lw	$2,%got($LC30)($28)
	addiu	$4,$2,%lo($LC30)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L85
	nop

$L84:
	lw	$2,%got($LC25)($28)
	addiu	$4,$2,%lo($LC25)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L85:
	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L79:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	decodificarATexto
	.size	decodificarATexto, .-decodificarATexto
	.rdata
	.align	2
$LC31:
	.ascii	"%[^\012]\000"
	.align	2
$LC32:
	.ascii	"El archivo ingresado por terminal no existe o esta vacio"
	.ascii	".\000"
	.text
	.align	2
	.globl	leerEntradaEstandar
	.set	nomips16
	.set	nomicromips
	.ent	leerEntradaEstandar
	.type	leerEntradaEstandar, @function
leerEntradaEstandar:
	.frame	$fp,56,$31		# vars= 16, regs= 4/0, args= 16, gp= 8
	.mask	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	move	$fp,$sp
	.cprestore	16
	move	$10,$sp
	move	$17,$10
	li	$10,1000			# 0x3e8
	addiu	$10,$10,-1
	sw	$10,24($fp)
	li	$10,1000			# 0x3e8
	move	$9,$10
	move	$8,$0
	srl	$10,$9,29
	sll	$4,$8,3
	or	$4,$10,$4
	sll	$5,$9,3
	li	$4,1000			# 0x3e8
	move	$7,$4
	move	$6,$0
	srl	$4,$7,29
	sll	$2,$6,3
	or	$2,$4,$2
	sll	$3,$7,3
	li	$2,1000			# 0x3e8
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,0
	sw	$2,28($fp)
	lw	$2,28($fp)
	sb	$0,0($2)
	lw	$2,28($fp)
	move	$5,$2
	lw	$2,%got($LC31)($28)
	addiu	$4,$2,%lo($LC31)
	lw	$2,%call16(__isoc99_scanf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__isoc99_scanf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	move	$4,$2
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	move	$3,$0
	lw	$2,32($fp)
	bne	$2,$3,$L87
	nop

	lw	$2,%got($LC32)($28)
	addiu	$4,$2,%lo($LC32)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	b	$L88
	nop

$L87:
	lw	$16,28($fp)
	move	$4,$16
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addu	$2,$16,$2
	li	$3,10			# 0xa
	sb	$3,0($2)
	sb	$0,1($2)
	lw	$2,28($fp)
	lw	$5,32($fp)
	move	$4,$2
	lw	$2,%got(codificarTexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificarTexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
$L88:
	move	$sp,$17
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	leerEntradaEstandar
	.size	leerEntradaEstandar, .-leerEntradaEstandar
	.rdata
	.align	2
$LC33:
	.ascii	"Faltan argumentos\000"
	.text
	.align	2
	.globl	manejarEntradaEstandar
	.set	nomips16
	.set	nomicromips
	.ent	manejarEntradaEstandar
	.type	manejarEntradaEstandar, @function
manejarEntradaEstandar:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	move	$4,$0
	lw	$2,%call16(isatty)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,isatty
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L91
	nop

	lw	$2,%got($LC33)($28)
	addiu	$4,$2,%lo($LC33)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L90
	nop

$L91:
	lw	$2,%got(leerEntradaEstandar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,leerEntradaEstandar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	beq	$2,$0,$L94
	nop

	lw	$4,24($fp)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L90
	nop

$L94:
	nop
$L90:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarEntradaEstandar
	.size	manejarEntradaEstandar, .-manejarEntradaEstandar
	.rdata
	.align	2
$LC34:
	.ascii	"No se pudo abrir el archivo de salida\000"
	.align	2
$LC35:
	.ascii	"%s\012\000"
	.align	2
$LC36:
	.ascii	"El uso de los parametros no es correcto\000"
	.text
	.align	2
	.globl	manejarEntrada
	.set	nomips16
	.set	nomicromips
	.ent	manejarEntrada
	.type	manejarEntrada, @function
manejarEntrada:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$3,40($fp)
	li	$2,3			# 0x3
	bne	$3,$2,$L96
	nop

	lw	$2,44($fp)
	addiu	$2,$2,8
	lw	$3,0($2)
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	move	$4,$3
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L97
	nop

	lw	$2,%got($LC34)($28)
	addiu	$4,$2,%lo($LC34)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L95
	nop

$L97:
	lw	$2,%got(leerEntradaEstandar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,leerEntradaEstandar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L99
	nop

	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L95
	nop

$L99:
	lw	$6,28($fp)
	lw	$2,%got($LC35)($28)
	addiu	$5,$2,%lo($LC35)
	lw	$4,24($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,28($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L95
	nop

$L96:
	lw	$2,%got($LC36)($28)
	addiu	$4,$2,%lo($LC36)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L95:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarEntrada
	.size	manejarEntrada, .-manejarEntrada
	.rdata
	.align	2
$LC37:
	.ascii	"-d\000"
	.align	2
$LC38:
	.ascii	"-h\000"
	.align	2
$LC39:
	.ascii	"-V\000"
	.align	2
$LC40:
	.ascii	"-i\000"
	.align	2
$LC41:
	.ascii	"No es un argumento valido\000"
	.text
	.align	2
	.globl	manejarParametros
	.set	nomips16
	.set	nomicromips
	.ent	manejarParametros
	.type	manejarParametros, @function
manejarParametros:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$2,36($fp)
	addiu	$2,$2,4
	lw	$3,0($2)
	lw	$2,%got($LC19)($28)
	addiu	$5,$2,%lo($LC19)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L101
	nop

	lw	$5,36($fp)
	lw	$4,32($fp)
	lw	$2,%got(manejarEntrada)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarEntrada
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L107
	nop

$L101:
	lw	$2,36($fp)
	addiu	$2,$2,4
	lw	$3,0($2)
	lw	$2,%got($LC37)($28)
	addiu	$5,$2,%lo($LC37)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L103
	nop

	lw	$5,36($fp)
	lw	$4,32($fp)
	lw	$2,%got(decodificarATexto)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificarATexto
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L107
	nop

$L103:
	lw	$2,36($fp)
	addiu	$2,$2,4
	lw	$3,0($2)
	lw	$2,%got($LC38)($28)
	addiu	$5,$2,%lo($LC38)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L104
	nop

	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L107
	nop

$L104:
	lw	$2,36($fp)
	addiu	$2,$2,4
	lw	$3,0($2)
	lw	$2,%got($LC39)($28)
	addiu	$5,$2,%lo($LC39)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L105
	nop

	lw	$2,%got(mostrarVersion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mostrarVersion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L107
	nop

$L105:
	lw	$2,36($fp)
	addiu	$2,$2,4
	lw	$3,0($2)
	lw	$2,%got($LC40)($28)
	addiu	$5,$2,%lo($LC40)
	move	$4,$3
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L106
	nop

	lw	$5,36($fp)
	lw	$4,32($fp)
	lw	$2,%got(convertirABase64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,convertirABase64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L107
	nop

$L106:
	lw	$2,%got($LC41)($28)
	addiu	$4,$2,%lo($LC41)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L107:
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarParametros
	.size	manejarParametros, .-manejarParametros
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	li	$2,1			# 0x1
	lw	$3,32($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L109
	nop

	lw	$5,36($fp)
	lw	$4,32($fp)
	lw	$2,%got(manejarParametros)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarParametros
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L110
	nop

$L109:
	lw	$2,%got(manejarEntradaEstandar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarEntradaEstandar
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L110:
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
