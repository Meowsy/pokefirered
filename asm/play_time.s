	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start PlayTimeCounter_Reset
PlayTimeCounter_Reset: @ 8054814
	ldr r1, _08054830 @ =gUnknown_3000E7C
	movs r0, 0
	strb r0, [r1]
	ldr r2, _08054834 @ =gSaveBlock2Ptr
	ldr r3, [r2]
	movs r1, 0
	movs r0, 0
	strh r0, [r3, 0xE]
	strb r1, [r3, 0x10]
	ldr r0, [r2]
	strb r1, [r0, 0x11]
	ldr r0, [r2]
	strb r1, [r0, 0x12]
	bx lr
	.align 2, 0
_08054830: .4byte gUnknown_3000E7C
_08054834: .4byte gSaveBlock2Ptr
	thumb_func_end PlayTimeCounter_Reset

	thumb_func_start PlayTimeCounter_Start
PlayTimeCounter_Start: @ 8054838
	push {lr}
	ldr r1, _08054854 @ =gUnknown_3000E7C
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08054858 @ =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrh r1, [r0, 0xE]
	ldr r0, _0805485C @ =0x000003e7
	cmp r1, r0
	bls _08054850
	bl PlayTimeCounter_SetToMax
_08054850:
	pop {r0}
	bx r0
	.align 2, 0
_08054854: .4byte gUnknown_3000E7C
_08054858: .4byte gSaveBlock2Ptr
_0805485C: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_Start

	thumb_func_start sub_8054860
sub_8054860: @ 8054860
	ldr r1, _08054868 @ =gUnknown_3000E7C
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08054868: .4byte gUnknown_3000E7C
	thumb_func_end sub_8054860

	thumb_func_start PlayTimeCounter_Update
PlayTimeCounter_Update: @ 805486C
	push {lr}
	ldr r0, _080548C8 @ =gUnknown_3000E7C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080548C4
	ldr r2, _080548CC @ =gSaveBlock2Ptr
	ldr r0, [r2]
	ldrb r1, [r0, 0x12]
	adds r1, 0x1
	movs r3, 0
	strb r1, [r0, 0x12]
	ldr r1, [r2]
	ldrb r0, [r1, 0x12]
	cmp r0, 0x3B
	bls _080548C4
	strb r3, [r1, 0x12]
	ldr r0, [r2]
	ldrb r1, [r0, 0x11]
	adds r1, 0x1
	strb r1, [r0, 0x11]
	ldr r1, [r2]
	ldrb r0, [r1, 0x11]
	cmp r0, 0x3B
	bls _080548C4
	strb r3, [r1, 0x11]
	ldr r0, [r2]
	ldrb r1, [r0, 0x10]
	adds r1, 0x1
	strb r1, [r0, 0x10]
	ldr r1, [r2]
	ldrb r0, [r1, 0x10]
	cmp r0, 0x3B
	bls _080548C4
	strb r3, [r1, 0x10]
	ldr r0, [r2]
	ldrh r1, [r0, 0xE]
	adds r1, 0x1
	strh r1, [r0, 0xE]
	lsls r1, 16
	ldr r0, _080548D0 @ =0x03e70000
	cmp r1, r0
	bls _080548C4
	bl PlayTimeCounter_SetToMax
_080548C4:
	pop {r0}
	bx r0
	.align 2, 0
_080548C8: .4byte gUnknown_3000E7C
_080548CC: .4byte gSaveBlock2Ptr
_080548D0: .4byte 0x03e70000
	thumb_func_end PlayTimeCounter_Update

	thumb_func_start PlayTimeCounter_SetToMax
PlayTimeCounter_SetToMax: @ 80548D4
	ldr r1, _080548F0 @ =gUnknown_3000E7C
	movs r0, 0x2
	strb r0, [r1]
	ldr r2, _080548F4 @ =gSaveBlock2Ptr
	ldr r3, [r2]
	ldr r0, _080548F8 @ =0x000003e7
	strh r0, [r3, 0xE]
	movs r1, 0x3B
	strb r1, [r3, 0x10]
	ldr r0, [r2]
	strb r1, [r0, 0x11]
	ldr r0, [r2]
	strb r1, [r0, 0x12]
	bx lr
	.align 2, 0
_080548F0: .4byte gUnknown_3000E7C
_080548F4: .4byte gSaveBlock2Ptr
_080548F8: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_SetToMax

	.align 2, 0 @ Don't pad with nop.
