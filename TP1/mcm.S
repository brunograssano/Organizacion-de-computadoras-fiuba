
#include <sys/regdef.h>

#define SS 32/*Stack size*/

/*ABA CALLER*/
#define O_A1 (SS+4)
#define O_A0 (SS)

/*SRA (de 24 a 36)*/
#define O_RA 24
#define O_GP 20
#define O_FP 16

/*LTA (no se usa)*/
/*VARIABLES LOCALES*/
/*VARIABLES TEMPORALES*/

/*ABA  (de 0 a 16)*/

.extern mcd
.globl mcm
.text
.align 2
.ent mcm

mcm:
	/*Hacemos espacio para el stack*/
	subu sp, sp, SS

	/*SRA*/
	sw ra, O_RA(sp) 	/* Guardamos el retorno */
	sw fp, O_FP(sp)
	sw gp, O_GP(sp)
	move fp, sp

	/*ABA CALLER*/
	sw a0, O_A0(sp) 	/*Guardamos lo recibido en el ABA del caller*/
	sw a1, O_A1(sp)

	jal mcd

	lw a0, O_A0(sp) 	/* Obtenemos lo recibido devuelta*/
	lw a1, O_A1(sp)

	add t0, zero, zero
	add t1, zero, zero
	mfhi t1
	multu a0, a1 			/*$LO <- m * n (se guarda el resultado en $LO)*/
	mflo t0 					/*t0 <- m*n (Obtenemos el resultado)*/

	bne t1,zero,overflow

	div t0, v0				/* En v0 esta el resultado de mcd */

	mflo v0						/* Devolvemos tambien en v0 */

return:
	lw ra, O_RA(sp)		/* Restauramos gp,fp y obtenemos la direccion de retorno*/
	lw gp, O_GP(sp)
	lw fp, O_FP(sp)

	/*Desarmar stack*/
	addiu sp, sp, SS

	jr ra

overflow:
	add v0, zero, zero
	j return

.end mcm
