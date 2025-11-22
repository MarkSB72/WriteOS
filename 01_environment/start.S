.global _Reset
_Reset:
 LDR sp, =stack_top
 BL hello_world
 B .
 