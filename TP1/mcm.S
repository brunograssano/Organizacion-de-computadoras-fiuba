
#include <sys/regdef.h>

#define SS 36/*Stack size*/

/*ABA CALLER*/
#define O_A1 (SS+4)
#define O_A0 (SS)

/*SRA*/
#define O_RA 32
#define O_GP 28
#define O_FP 24


/*LTA*/
/*VARIABLES LOCALES*/
#define O_RESULTADO_MULTIPLICACION 16
/*VARIABLES TEMPORALES*/


/*ABA*/

.extern mcd
.globl mcm
.text
.align 2
.ent mcm

mcm:

	/*Hacemos espacio para el stack*/
	subu sp, sp, SS

	/*SRA*/
	sw ra, O_RA(sp)
	sw fp, O_FP(sp)
	sw gp, O_GP(sp)
	move fp, sp

	/*ABA CALLER*/
	sw a0, O_A0(sp) /**/
	sw a1, O_A1(sp) /**/

	multu a0, a1 /*$LO <- m * n*/
	mflo t0 /*t0 <- m*n */

	sw t0, O_RESULTADO_MULTIPLICACION(fp)

	jal mcd

	lw t0, O_RESULTADO_MULTIPLICACION(fp)

	div t0, v0

	mflo v0

	lw ra, O_RA(sp)
	lw gp, O_GP(sp)
	lw fp, O_FP(sp)

	/*Desarmar stack*/
	addiu sp, sp, SS

	jr ra

.end mcm
