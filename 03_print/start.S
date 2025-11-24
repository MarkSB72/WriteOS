.section .startup
.code 32
.align 0
.global _start
.extern _vector_reset
.extern _vector_undefined
.extern _vector_swi
.extern _vector_prefetch_abort
.extern _vector_data_abort
.extern _vector_reserved
.extern _vector_irq
.extern _vector_fiq

_start:
    ldr pc, _vector_reset
    ldr pc, _vector_undefined
    ldr pc, _vector_swi
    ldr pc, _vector_prefetch_abort
    ldr pc, _vector_data_abort
    ldr pc, _vector_reserved
    ldr pc, _vector_irq
    ldr pc, _vector_fiq

.align 4
_vector_reset: .word __vector_reset
_vector_undefined: .word __vector_undefined
_vector_swi: .word __vector_swi
_vector_prefetch_abort: .word __vector_prefetch_abort
_vector_data_abort: .word __vector_data_abort
_vector_reserved: .word __vector_reserved
_vector_irq: .word __vector_irq
_vector_fiq: .word __vector_fiq
