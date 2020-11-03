	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.globl	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL
	.rdata
	.align	2
	.type	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL, @object
	.size	LARGO_MAXIMO_ARCHIVO_POR_TERMINAL, 4
LARGO_MAXIMO_ARCHIVO_POR_TERMINAL:
	.word	1000
	.globl	TERMINO
	.align	2
	.type	TERMINO, @object
	.size	TERMINO, 4
TERMINO:
	.word	-1
	.globl	VACIO
	.align	2
	.type	VACIO, @object
	.size	VACIO, 4
VACIO:
	.space	4
	.globl	ERROR
	.align	2
	.type	ERROR, @object
	.size	ERROR, 4
ERROR:
	.word	-1
	.align	2
$LC0:
	.ascii	"Uso: \000"
	.align	2
$LC1:
	.ascii	" tp -h\000"
	.align	2
$LC2:
	.ascii	" tp -v\000"
	.align	2
$LC3:
	.ascii	" tp [opciones]\000"
	.align	2
$LC4:
	.ascii	"Opciones: \000"
	.align	2
$LC5:
	.ascii	" -v, --version    Imprime la version y termina el progra"
	.ascii	"ma.\000"
	.align	2
$LC6:
	.ascii	" -h, --help       Imprime esta informacion.\000"
	.align	2
$LC7:
	.ascii	" -o, --output     Indica que le sigue la direccion al ar"
	.ascii	"chivo de salida.\000"
	.align	2
$LC8:
	.ascii	" -i, --input      Indica que le sigue la direccion al ar"
	.ascii	"chivo de entrada.\000"
	.align	2
$LC9:
	.ascii	" -d, --decode     Decodifica un archivo codificado en ba"
	.ascii	"se 64 .\000"
	.align	2
$LC10:
	.ascii	"Ejemplos: \000"
	.align	2
$LC11:
	.ascii	"\011tp -i input.txt -o output.txt\000"
	.align	2
$LC12:
	.ascii	"\011tp -d -i inputInBase64.txt -o outputInText.txt\000"
	.align	2
$LC13:
	.ascii	"\011cat input.txt | ./tp\000"
	.align	2
$LC14:
	.ascii	"\011cat input.txt | ./tp -d\000"
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
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
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
	.ascii	"Version 1.0.1\000"
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
	.rdata
	.align	2
$LC16:
	.ascii	"Puede ver ayuda enviando el parametro -h \012\000"
	.align	2
$LC17:
	.ascii	"i:dho:v\000"
	.align	2
$LC18:
	.ascii	"No son opciones validas las siguientes:\012\000"
	.align	2
$LC19:
	.ascii	"%s\012\000"
	.text
	.align	2
	.globl	manejarParametros
	.set	nomips16
	.set	nomicromips
	.ent	manejarParametros
	.type	manejarParametros, @function
manejarParametros:
	.frame	$fp,56,$31		# vars= 16, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$4,56($fp)
	sw	$5,60($fp)
	sw	$6,64($fp)
	sw	$7,68($fp)
	sw	$0,40($fp)
	sb	$0,32($fp)
	sb	$0,33($fp)
	b	$L4
	nop

$L14:
	lw	$2,36($fp)
	addiu	$2,$2,-100
	sltu	$3,$2,19
	beq	$3,$0,$L5
	nop

	sll	$3,$2,2
	lw	$2,%got($L7)($28)
	addiu	$2,$2,%lo($L7)
	addu	$2,$3,$2
	lw	$2,0($2)
	addu	$2,$2,$28
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L7:
	.gpword	$L6
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L8
	.gpword	$L9
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L10
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L5
	.gpword	$L11
	.text
$L6:
	lw	$2,72($fp)
	li	$3,1			# 0x1
	sb	$3,0($2)
	b	$L4
	nop

$L9:
	lw	$2,%got(optarg)($28)
	lw	$2,0($2)
	move	$5,$2
	lw	$4,64($fp)
	lw	$2,%call16(strcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,24($fp)
	b	$L4
	nop

$L10:
	lw	$2,%got(optarg)($28)
	lw	$2,0($2)
	move	$5,$2
	lw	$4,68($fp)
	lw	$2,%call16(strcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcpy
1:	jalr	$25
	nop

	lw	$28,24($fp)
	b	$L4
	nop

$L11:
	lbu	$2,33($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L4
	nop

	lw	$2,76($fp)
	li	$3,1			# 0x1
	sb	$3,0($2)
	li	$2,1			# 0x1
	sb	$2,33($fp)
	lw	$2,%got(mostrarVersion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,mostrarVersion
1:	jalr	$25
	nop

	lw	$28,24($fp)
	b	$L4
	nop

$L8:
	lbu	$2,32($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L4
	nop

	lw	$2,76($fp)
	li	$3,1			# 0x1
	sb	$3,0($2)
	li	$2,1			# 0x1
	sb	$2,32($fp)
	lw	$2,%got(imprimirAyuda)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,imprimirAyuda
1:	jalr	$25
	nop

	lw	$28,24($fp)
	b	$L4
	nop

$L5:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,42			# 0x2a
	li	$5,1			# 0x1
	lw	$2,%got($LC16)($28)
	addiu	$4,$2,%lo($LC16)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,24($fp)
$L4:
	addiu	$2,$fp,40
	sw	$2,16($sp)
	lw	$2,%got(opcionesLargas.3168)($28)
	addiu	$7,$2,%lo(opcionesLargas.3168)
	lw	$2,%got($LC17)($28)
	addiu	$6,$2,%lo($LC17)
	lw	$5,60($fp)
	lw	$4,56($fp)
	lw	$2,%call16(getopt_long)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,getopt_long
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,36($fp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$3,36($fp)
	bne	$3,$2,$L14
	nop

	lw	$2,%got(optind)($28)
	lw	$3,0($2)
	lw	$2,56($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L18
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,40			# 0x28
	li	$5,1			# 0x1
	lw	$2,%got($LC18)($28)
	addiu	$4,$2,%lo($LC18)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,24($fp)
	b	$L16
	nop

$L17:
	lw	$2,%got(stderr)($28)
	lw	$7,0($2)
	lw	$2,%got(optind)($28)
	lw	$2,0($2)
	addiu	$4,$2,1
	lw	$3,%got(optind)($28)
	sw	$4,0($3)
	sll	$2,$2,2
	lw	$3,60($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$6,$2
	lw	$2,%got($LC19)($28)
	addiu	$5,$2,%lo($LC19)
	move	$4,$7
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,24($fp)
$L16:
	lw	$2,%got(optind)($28)
	lw	$3,0($2)
	lw	$2,56($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L17
	nop

$L18:
	nop
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarParametros
	.size	manejarParametros, .-manejarParametros
	.align	2
	.globl	decodificacion
	.set	nomips16
	.set	nomicromips
	.ent	decodificacion
	.type	decodificacion, @function
decodificacion:
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
	sw	$0,24($fp)
	b	$L20
	nop

$L22:
	lw	$5,44($fp)
	lw	$4,40($fp)
	lw	$2,%call16(decodificar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
$L20:
	lw	$4,40($fp)
	lw	$2,%call16(feof)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,feof
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L21
	nop

	li	$2,-1			# 0xffffffffffffffff
	lw	$3,24($fp)
	bne	$3,$2,$L22
	nop

$L21:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	decodificacion
	.size	decodificacion, .-decodificacion
	.rdata
	.align	2
$LC20:
	.ascii	"r\000"
	.align	2
$LC21:
	.ascii	"Hubo un error al abrir el archivo en: %s\000"
	.align	2
$LC22:
	.ascii	"w\000"
	.align	2
$LC23:
	.ascii	"Hubo un error al crear el archivo de salida en: %s\000"
	.text
	.align	2
	.globl	manejarDecodificacionArchivos
	.set	nomips16
	.set	nomicromips
	.ent	manejarDecodificacionArchivos
	.type	manejarDecodificacionArchivos, @function
manejarDecodificacionArchivos:
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
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	lw	$4,48($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L25
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,48($fp)
	lw	$2,%got($LC21)($28)
	addiu	$5,$2,%lo($LC21)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L26
	nop

$L25:
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	lw	$4,52($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L27
	nop

	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,52($fp)
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L26
	nop

$L27:
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(decodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
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
	lw	$2,32($fp)
$L26:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarDecodificacionArchivos
	.size	manejarDecodificacionArchivos, .-manejarDecodificacionArchivos
	.align	2
	.globl	manejarDecodificacionEntradaArchivoSalidaEstandar
	.set	nomips16
	.set	nomicromips
	.ent	manejarDecodificacionEntradaArchivoSalidaEstandar
	.type	manejarDecodificacionEntradaArchivoSalidaEstandar, @function
manejarDecodificacionEntradaArchivoSalidaEstandar:
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
	sw	$0,24($fp)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	lw	$4,40($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L29
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,40($fp)
	lw	$2,%got($LC21)($28)
	addiu	$5,$2,%lo($LC21)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L30
	nop

$L29:
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	move	$5,$2
	lw	$4,28($fp)
	lw	$2,%got(decodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
$L30:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarDecodificacionEntradaArchivoSalidaEstandar
	.size	manejarDecodificacionEntradaArchivoSalidaEstandar, .-manejarDecodificacionEntradaArchivoSalidaEstandar
	.align	2
	.globl	manejarDecodificacionEntradaEstandarSalidaArchivo
	.set	nomips16
	.set	nomicromips
	.ent	manejarDecodificacionEntradaEstandarSalidaArchivo
	.type	manejarDecodificacionEntradaEstandarSalidaArchivo, @function
manejarDecodificacionEntradaEstandarSalidaArchivo:
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
	sw	$0,24($fp)
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	lw	$4,40($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L32
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,40($fp)
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L33
	nop

$L32:
	lw	$2,%got(stdin)($28)
	lw	$2,0($2)
	lw	$5,28($fp)
	move	$4,$2
	lw	$2,%got(decodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
$L33:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarDecodificacionEntradaEstandarSalidaArchivo
	.size	manejarDecodificacionEntradaEstandarSalidaArchivo, .-manejarDecodificacionEntradaEstandarSalidaArchivo
	.rdata
	.align	2
$LC24:
	.ascii	"Debe mandar mas argumentos, o mandar por entrada estanda"
	.ascii	"r. Puede ver ayuda enviando el parametro -h \012\000"
	.text
	.align	2
	.globl	manejarDecodificacion
	.set	nomips16
	.set	nomicromips
	.ent	manejarDecodificacion
	.type	manejarDecodificacion, @function
manejarDecodificacion:
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
	lw	$4,48($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$4,52($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	move	$3,$0
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L35
	nop

	move	$3,$0
	lw	$2,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L35
	nop

	lw	$5,52($fp)
	lw	$4,48($fp)
	lw	$2,%got(manejarDecodificacionArchivos)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarDecodificacionArchivos
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L36
	nop

$L35:
	move	$3,$0
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L37
	nop

	move	$3,$0
	lw	$2,32($fp)
	bne	$2,$3,$L37
	nop

	lw	$4,48($fp)
	lw	$2,%got(manejarDecodificacionEntradaArchivoSalidaEstandar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarDecodificacionEntradaArchivoSalidaEstandar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L36
	nop

$L37:
	move	$3,$0
	lw	$2,28($fp)
	bne	$2,$3,$L38
	nop

	move	$3,$0
	lw	$2,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L38
	nop

	lw	$4,52($fp)
	lw	$2,%got(manejarDecodificacionEntradaEstandarSalidaArchivo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarDecodificacionEntradaEstandarSalidaArchivo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L36
	nop

$L38:
	move	$3,$0
	lw	$2,28($fp)
	bne	$2,$3,$L39
	nop

	move	$3,$0
	lw	$2,32($fp)
	bne	$2,$3,$L39
	nop

	move	$4,$0
	lw	$2,%call16(isatty)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,isatty
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L39
	nop

	lw	$2,%got(stdin)($28)
	lw	$3,0($2)
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	move	$5,$2
	move	$4,$3
	lw	$2,%got(decodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,decodificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L36
	nop

$L39:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,101			# 0x65
	li	$5,1			# 0x1
	lw	$2,%got($LC24)($28)
	addiu	$4,$2,%lo($LC24)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,24($fp)
$L36:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarDecodificacion
	.size	manejarDecodificacion, .-manejarDecodificacion
	.align	2
	.globl	codificacion
	.set	nomips16
	.set	nomicromips
	.ent	codificacion
	.type	codificacion, @function
codificacion:
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
	sw	$0,24($fp)
	b	$L42
	nop

$L44:
	lw	$5,44($fp)
	lw	$4,40($fp)
	lw	$2,%call16(codificar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
$L42:
	lw	$4,40($fp)
	lw	$2,%call16(feof)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,feof
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L43
	nop

	li	$2,-1			# 0xffffffffffffffff
	lw	$3,24($fp)
	bne	$3,$2,$L44
	nop

$L43:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	codificacion
	.size	codificacion, .-codificacion
	.rdata
	.align	2
$LC25:
	.ascii	"Hubo un error al abrir el archivo de en: %s\000"
	.text
	.align	2
	.globl	manejarCodificacionArchivos
	.set	nomips16
	.set	nomicromips
	.ent	manejarCodificacionArchivos
	.type	manejarCodificacionArchivos, @function
manejarCodificacionArchivos:
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
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	lw	$4,48($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L47
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,48($fp)
	lw	$2,%got($LC25)($28)
	addiu	$5,$2,%lo($LC25)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L48
	nop

$L47:
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	lw	$4,52($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L49
	nop

	lw	$4,24($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,52($fp)
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L48
	nop

$L49:
	lw	$5,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(codificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
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
	lw	$2,32($fp)
$L48:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarCodificacionArchivos
	.size	manejarCodificacionArchivos, .-manejarCodificacionArchivos
	.align	2
	.globl	manejarCodificacionEntradaArchivoSalidaEstandar
	.set	nomips16
	.set	nomicromips
	.ent	manejarCodificacionEntradaArchivoSalidaEstandar
	.type	manejarCodificacionEntradaArchivoSalidaEstandar, @function
manejarCodificacionEntradaArchivoSalidaEstandar:
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
	sw	$0,24($fp)
	lw	$2,%got($LC20)($28)
	addiu	$5,$2,%lo($LC20)
	lw	$4,40($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L51
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,40($fp)
	lw	$2,%got($LC21)($28)
	addiu	$5,$2,%lo($LC21)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L52
	nop

$L51:
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	move	$5,$2
	lw	$4,28($fp)
	lw	$2,%got(codificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
$L52:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarCodificacionEntradaArchivoSalidaEstandar
	.size	manejarCodificacionEntradaArchivoSalidaEstandar, .-manejarCodificacionEntradaArchivoSalidaEstandar
	.align	2
	.globl	manejarCodificacionEntradaEstandarSalidaArchivo
	.set	nomips16
	.set	nomicromips
	.ent	manejarCodificacionEntradaEstandarSalidaArchivo
	.type	manejarCodificacionEntradaEstandarSalidaArchivo, @function
manejarCodificacionEntradaEstandarSalidaArchivo:
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
	sw	$0,24($fp)
	lw	$2,%got($LC22)($28)
	addiu	$5,$2,%lo($LC22)
	lw	$4,40($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L54
	nop

	lw	$2,%got(stderr)($28)
	lw	$3,0($2)
	lw	$6,40($fp)
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	move	$4,$3
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L55
	nop

$L54:
	lw	$2,%got(stdin)($28)
	lw	$2,0($2)
	lw	$5,28($fp)
	move	$4,$2
	lw	$2,%got(codificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
$L55:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarCodificacionEntradaEstandarSalidaArchivo
	.size	manejarCodificacionEntradaEstandarSalidaArchivo, .-manejarCodificacionEntradaEstandarSalidaArchivo
	.align	2
	.globl	manejarCodificacion
	.set	nomips16
	.set	nomicromips
	.ent	manejarCodificacion
	.type	manejarCodificacion, @function
manejarCodificacion:
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
	sw	$0,24($fp)
	lw	$4,48($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$4,52($fp)
	lw	$2,%call16(strlen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strlen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	move	$3,$0
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L57
	nop

	move	$3,$0
	lw	$2,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L57
	nop

	lw	$5,52($fp)
	lw	$4,48($fp)
	lw	$2,%got(manejarCodificacionArchivos)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarCodificacionArchivos
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L58
	nop

$L57:
	move	$3,$0
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L59
	nop

	move	$3,$0
	lw	$2,32($fp)
	bne	$2,$3,$L59
	nop

	lw	$4,48($fp)
	lw	$2,%got(manejarCodificacionEntradaArchivoSalidaEstandar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarCodificacionEntradaArchivoSalidaEstandar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L58
	nop

$L59:
	move	$3,$0
	lw	$2,28($fp)
	bne	$2,$3,$L60
	nop

	move	$3,$0
	lw	$2,32($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L60
	nop

	lw	$4,52($fp)
	lw	$2,%got(manejarCodificacionEntradaEstandarSalidaArchivo)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarCodificacionEntradaEstandarSalidaArchivo
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L58
	nop

$L60:
	move	$3,$0
	lw	$2,28($fp)
	bne	$2,$3,$L61
	nop

	move	$3,$0
	lw	$2,32($fp)
	bne	$2,$3,$L61
	nop

	move	$4,$0
	lw	$2,%call16(isatty)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,isatty
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L61
	nop

	lw	$2,%got(stdin)($28)
	lw	$3,0($2)
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	move	$5,$2
	move	$4,$3
	lw	$2,%got(codificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,codificacion
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L58
	nop

$L61:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,101			# 0x65
	li	$5,1			# 0x1
	lw	$2,%got($LC24)($28)
	addiu	$4,$2,%lo($LC24)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,24($fp)
$L58:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	manejarCodificacion
	.size	manejarCodificacion, .-manejarCodificacion
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,560,$31		# vars= 520, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-560
	sw	$31,556($sp)
	sw	$fp,552($sp)
	move	$fp,$sp
	.cprestore	24
	sw	$4,560($fp)
	sw	$5,564($fp)
	sw	$0,36($fp)
	addiu	$2,$fp,40
	li	$3,252			# 0xfc
	move	$6,$3
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$0,292($fp)
	addiu	$2,$fp,296
	li	$3,252			# 0xfc
	move	$6,$3
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sb	$0,548($fp)
	sb	$0,549($fp)
	sw	$0,32($fp)
	addiu	$4,$fp,292
	addiu	$3,$fp,36
	addiu	$2,$fp,549
	sw	$2,20($sp)
	addiu	$2,$fp,548
	sw	$2,16($sp)
	move	$7,$4
	move	$6,$3
	lw	$5,564($fp)
	lw	$4,560($fp)
	lw	$2,%got(manejarParametros)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarParametros
1:	jalr	$25
	nop

	lw	$28,24($fp)
	lbu	$2,548($fp)
	beq	$2,$0,$L64
	nop

	lbu	$2,549($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L64
	nop

	addiu	$3,$fp,292
	addiu	$2,$fp,36
	move	$5,$3
	move	$4,$2
	lw	$2,%got(manejarDecodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarDecodificacion
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,32($fp)
	b	$L65
	nop

$L64:
	lbu	$2,549($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L65
	nop

	addiu	$3,$fp,292
	addiu	$2,$fp,36
	move	$5,$3
	move	$4,$2
	lw	$2,%got(manejarCodificacion)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,manejarCodificacion
1:	jalr	$25
	nop

	lw	$28,24($fp)
	sw	$2,32($fp)
$L65:
	lw	$2,32($fp)
	move	$sp,$fp
	lw	$31,556($sp)
	lw	$fp,552($sp)
	addiu	$sp,$sp,560
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC26:
	.ascii	"input\000"
	.align	2
$LC27:
	.ascii	"decode\000"
	.align	2
$LC28:
	.ascii	"help\000"
	.align	2
$LC29:
	.ascii	"output\000"
	.align	2
$LC30:
	.ascii	"version\000"
	.section	.data.rel.local,"aw",@progbits
	.align	2
	.type	opcionesLargas.3168, @object
	.size	opcionesLargas.3168, 96
opcionesLargas.3168:
	.word	$LC26
	.word	1
	.word	0
	.word	105
	.word	$LC27
	.word	0
	.word	0
	.word	100
	.word	$LC28
	.word	0
	.word	0
	.word	104
	.word	$LC29
	.word	1
	.word	0
	.word	111
	.word	$LC30
	.word	0
	.word	0
	.word	118
	.word	0
	.word	0
	.word	0
	.word	0
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
