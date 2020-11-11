#include <sys/regdef.h>

#define SS 8/*Stack size*/

/*ABA CALLER*/
#define O_A1 (SS+4)
#define O_A0 (SS)

/*SRA (de 0 a 8)*/
#define O_FP 4
#define O_GP 0

/*LTA (no lo usamos)*/
/*ABA MCD (es hoja)*/

.globl mcd
.text
.align 2
.ent mcd
.cprestore O_GP

mcd:

	subu sp, sp, SS

	/*SRA*/
	sw fp, O_FP(sp)
	sw gp, O_GP(sp)
	move fp, sp

	/*ABA del caller*/
	sw a0, O_A0(sp) 			/*Guardamos lo recibido en el ABA del caller*/
	sw a1, O_A1(sp)

loop:
	beq a1, zero, finMcd 	/* Si n == 0 -> finMcd*/
	add t0, zero, a1 			/* t0 <- numero n*/
	div a0, a1 						/* m/n */
	mfhi a1 							/* a1 <- m mod n (el modulo se guarda en $HI)*/
	add a0, t0, zero 			/* a0 <- numero n */
	j loop


finMcd:
	add v0, zero, a0 			/*v0 <- numero mcd (Se devuelve por v0)*/

	lw gp, O_GP(sp)				/* Restauramos gp y fp*/
	lw fp, O_FP(sp)

	/*Desarmar stack*/
	addiu sp, sp, SS

	jr ra

.end mcd
