.section .context_switch, "awx"
.code64

# Expected arguments:
# - p4 address in `rdi`
# - entry point address in `rsi`
# - stack pointer in `rdx`
# - boot info ptr in `rcx`
context_switch:
    # load new P4 table
    mov cr3, rdi

    # load stack pointer
    mov rsp, rdx

    mov rdi, rcx

    # jump to entry point
    jmp rsi
context_switch_spin:
    jmp context_switch_spin
