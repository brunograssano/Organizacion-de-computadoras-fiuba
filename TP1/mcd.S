
#include <sys/regdef.h>

#define SS 8/*Stack size*/

/*ABA CALLER*/
#define O_A1 (SS+4)
#define O_A0 (SS)

/*SRA*/
#define O_FP 4
#define O_GP 0

/*LTA*/
/*ABA MCD*/


.globl mcd
.text
.align 2
.ent mcd

mcd:

	subu sp, sp, SS

	/*SRA*/
	sw fp, O_FP(sp)
	sw gp, O_GP(sp)
	move fp, sp

	/*ABA del caller*/
	sw a0, O_A0(sp) /*numero m <- a0*/ 
	sw a1, O_A1(sp) /*numero n <- a1*/


	/*LTA*/
	add t0, zero, zero /* t0 <- maximoEncontrado */ 

loop:
	beq a1, zero, finMcd /*si n = 0 -> finMcd*/
	add t0, zero, a1 /*t0 <- numero n*/
	div a0, a1 /* m/n */
	mfhi a1 /* a1 <- m mod n */
	add a0, t0, zero /* a0 <- numero n */
	j loop
	

finMcd:
	add v0, zero, a0 /*v0 <- numero mcd*/

	lw gp, O_GP(sp) 
	lw fp, O_FP(sp) 

	/*Desarmar stack*/
	 addiu sp, sp, SS

	 jr ra

.end mcd 


/**/
/**/