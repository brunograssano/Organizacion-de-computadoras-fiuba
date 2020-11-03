	.file	1 "base64.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.globl	caracteresBase64
	.rdata
	.align	2
	.type	caracteresBase64, @object
	.size	caracteresBase64, 65
caracteresBase64:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
	.ascii	"456789+/\000"
	.globl	valorAscii
	.align	2
	.type	valorAscii, @object
	.size	valorAscii, 320
valorAscii:
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
	.align	2
$LC0:
	.ascii	"No se puede codificar, el metodo de entrada no existe\012"
	.ascii	"\000"
	.align	2
$LC1:
	.ascii	"No se puede codificar, el metodo de salida no existe\012"
	.ascii	"\000"
	.text
	.align	2
	.globl	codificar
	.set	nomips16
	.set	nomicromips
	.ent	codificar
	.type	codificar, @function
codificar:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,56($fp)
	sw	$5,60($fp)
	lw	$2,56($fp)
	bne	$2,$0,$L2
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,54			# 0x36
	li	$5,1			# 0x1
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L8
	nop

$L2:
	lw	$2,60($fp)
	bne	$2,$0,$L4
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,53			# 0x35
	li	$5,1			# 0x1
	lw	$2,%got($LC1)($28)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L8
	nop

$L4:
	sh	$0,40($fp)
	sb	$0,42($fp)
	li	$2,1027407872			# 0x3d3d0000
	ori	$2,$2,0x3d3d
	sw	$2,44($fp)
	addiu	$2,$fp,40
	lw	$7,56($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,24($fp)
	bgtz	$2,$L5
	nop

	move	$2,$0
	b	$L8
	nop

$L5:
	addiu	$2,$fp,40
	addiu	$2,$2,1
	lw	$7,56($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	addiu	$2,$fp,40
	addiu	$2,$2,2
	lw	$7,56($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,32($fp)
	lb	$2,40($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	sll	$2,$2,8
	lb	$3,41($fp)
	or	$2,$2,$3
	sw	$2,36($fp)
	lw	$2,36($fp)
	sll	$2,$2,8
	lb	$3,42($fp)
	or	$2,$2,$3
	sw	$2,36($fp)
	lw	$2,36($fp)
	sra	$2,$2,18
	andi	$2,$2,0x3f
	lw	$3,%got(caracteresBase64)($28)
	addu	$2,$3,$2
	lb	$2,0($2)
	sb	$2,44($fp)
	lw	$2,36($fp)
	sra	$2,$2,12
	andi	$2,$2,0x3f
	lw	$3,%got(caracteresBase64)($28)
	addu	$2,$3,$2
	lb	$2,0($2)
	sb	$2,45($fp)
	lw	$2,28($fp)
	blez	$2,$L6
	nop

	lw	$2,36($fp)
	sra	$2,$2,6
	andi	$2,$2,0x3f
	lw	$3,%got(caracteresBase64)($28)
	addu	$2,$3,$2
	lb	$2,0($2)
	sb	$2,46($fp)
$L6:
	lw	$2,32($fp)
	blez	$2,$L7
	nop

	lw	$2,36($fp)
	andi	$2,$2,0x3f
	lw	$3,%got(caracteresBase64)($28)
	addu	$2,$3,$2
	lb	$2,0($2)
	sb	$2,47($fp)
$L7:
	addiu	$2,$fp,44
	lw	$7,60($fp)
	li	$6,4			# 0x4
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L8:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	codificar
	.size	codificar, .-codificar
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
	bne	$2,$0,$L10
	nop

	lb	$2,8($fp)
	slt	$2,$2,58
	bne	$2,$0,$L11
	nop

$L10:
	lb	$2,8($fp)
	slt	$2,$2,65
	bne	$2,$0,$L12
	nop

	lb	$2,8($fp)
	slt	$2,$2,91
	bne	$2,$0,$L11
	nop

$L12:
	lb	$2,8($fp)
	slt	$2,$2,97
	bne	$2,$0,$L13
	nop

	lb	$2,8($fp)
	slt	$2,$2,123
	bne	$2,$0,$L11
	nop

$L13:
	lb	$3,8($fp)
	li	$2,43			# 0x2b
	beq	$3,$2,$L11
	nop

	lb	$3,8($fp)
	li	$2,47			# 0x2f
	beq	$3,$2,$L11
	nop

	lb	$3,8($fp)
	li	$2,61			# 0x3d
	bne	$3,$2,$L14
	nop

$L11:
	li	$2,1			# 0x1
	b	$L15
	nop

$L14:
	move	$2,$0
$L15:
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
$LC2:
	.ascii	"No se puede decodificar, el metodo de entrada no existe\012"
	.ascii	"\000"
	.align	2
$LC3:
	.ascii	"No se puede decodificar, el metodo de salida no existe\012"
	.ascii	"\000"
	.align	2
$LC4:
	.ascii	"El archivo enviado no esta en base 64.\012\000"
	.text
	.align	2
	.globl	decodificar
	.set	nomips16
	.set	nomicromips
	.ent	decodificar
	.type	decodificar, @function
decodificar:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,56($fp)
	sw	$5,60($fp)
	lw	$2,56($fp)
	bne	$2,$0,$L18
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,56			# 0x38
	li	$5,1			# 0x1
	lw	$2,%got($LC2)($28)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L33
	nop

$L18:
	lw	$2,60($fp)
	bne	$2,$0,$L20
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,55			# 0x37
	li	$5,1			# 0x1
	lw	$2,%got($LC3)($28)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L33
	nop

$L20:
	sw	$0,36($fp)
	sh	$0,40($fp)
	sb	$0,42($fp)
	addiu	$2,$fp,36
	lw	$7,56($fp)
	li	$6,1			# 0x1
	li	$5,4			# 0x4
	move	$4,$2
	lw	$2,%call16(fread)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fread
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bgtz	$2,$L21
	nop

	move	$2,$0
	b	$L33
	nop

$L21:
	sw	$0,24($fp)
	b	$L22
	nop

$L24:
	lw	$2,24($fp)
	addiu	$3,$fp,24
	addu	$2,$3,$2
	lb	$2,12($2)
	move	$4,$2
	lw	$2,%got(esCaracterValido)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,esCaracterValido
1:	jalr	$25
	nop

	lw	$28,16($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L23
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,39			# 0x27
	li	$5,1			# 0x1
	lw	$2,%got($LC4)($28)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L33
	nop

$L23:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L22:
	lw	$2,24($fp)
	slt	$2,$2,4
	bne	$2,$0,$L24
	nop

	lb	$2,36($fp)
	addiu	$2,$2,-43
	lw	$3,%got(valorAscii)($28)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,32($fp)
	lw	$2,32($fp)
	sll	$3,$2,6
	lb	$2,37($fp)
	addiu	$2,$2,-43
	lw	$4,%got(valorAscii)($28)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	or	$2,$3,$2
	sw	$2,32($fp)
	lb	$3,38($fp)
	li	$2,61			# 0x3d
	bne	$3,$2,$L25
	nop

	lw	$2,32($fp)
	sll	$2,$2,6
	b	$L26
	nop

$L25:
	lw	$2,32($fp)
	sll	$3,$2,6
	lb	$2,38($fp)
	addiu	$2,$2,-43
	lw	$4,%got(valorAscii)($28)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	or	$2,$3,$2
$L26:
	sw	$2,32($fp)
	lb	$3,39($fp)
	li	$2,61			# 0x3d
	bne	$3,$2,$L27
	nop

	lw	$2,32($fp)
	sll	$2,$2,6
	b	$L28
	nop

$L27:
	lw	$2,32($fp)
	sll	$3,$2,6
	lb	$2,39($fp)
	addiu	$2,$2,-43
	lw	$4,%got(valorAscii)($28)
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	or	$2,$3,$2
$L28:
	sw	$2,32($fp)
	lw	$2,32($fp)
	sra	$2,$2,16
	seb	$2,$2
	sb	$2,40($fp)
	lb	$3,38($fp)
	li	$2,61			# 0x3d
	beq	$3,$2,$L29
	nop

	lw	$2,32($fp)
	sra	$2,$2,8
	seb	$2,$2
	sb	$2,41($fp)
$L29:
	lb	$3,39($fp)
	li	$2,61			# 0x3d
	beq	$3,$2,$L30
	nop

	lw	$2,32($fp)
	seb	$2,$2
	sb	$2,42($fp)
$L30:
	addiu	$2,$fp,40
	lw	$7,60($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lb	$2,41($fp)
	beq	$2,$0,$L31
	nop

	addiu	$2,$fp,40
	addiu	$2,$2,1
	lw	$7,60($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L31:
	lb	$2,42($fp)
	beq	$2,$0,$L32
	nop

	addiu	$2,$fp,40
	addiu	$2,$2,2
	lw	$7,60($fp)
	li	$6,1			# 0x1
	li	$5,1			# 0x1
	move	$4,$2
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L32:
	move	$2,$0
$L33:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	decodificar
	.size	decodificar, .-decodificar
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
