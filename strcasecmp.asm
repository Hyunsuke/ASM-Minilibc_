section .text
global strcasecmp

strcasecmp:
    xor rax, rax         ; Initialise le résultat à zéro
    xor rcx, rcx         ; Initialise l'index de la boucle à zéro

.loop:
    cmp byte [rsi + rcx], 0  ; Comparer le caractère de la deuxième chaîne avec NULL
    je .end                  ; Si c'est NULL, terminer la comparaison

    mov al, byte [rdi + rcx]  ; Charge le caractère de la première chaîne dans AL
    mov r8b, byte [rsi + rcx] ; Charge le caractère correspondant de la deuxième chaîne dans R8

    cmp al, 0         ; Comparer le caractère de la première chaîne avec NULL
    je .end           ; Si c'est NULL, terminer la comparaison

    cmp r8, 0         ; Comparer le caractère de la deuxième chaîne avec NULL
    je .end           ; Si c'est NULL, terminer la comparaison

    cmp al, "Z"       ; Comparer avec 'Z'
    jle .lower        ; Si inférieur ou égal à 'Z', passer à .lower

.check_r8:
    cmp r8b, "Z"      ; Comparer avec 'Z'
    jle .lower_r8     ; Si inférieur ou égal à 'Z', passer à .lower_r8

.check_diff:
    cmp al, r8b       ; Comparer les caractères en ignorant la casse
    jne .end          ; Si les caractères ne correspondent pas, terminer la comparaison

    inc rcx           ; Incrémenter l'index pour passer au caractère suivant
    jmp .loop         ; Répéter la boucle

.lower:
    cmp al, "A"       ; Comparer avec 'A'
    jge .addicant     ; Si supérieur ou égal à 'A', passer à .addicant
    jmp .check_r8     ; Sinon, passer à .check_r8

.addicant:
    add rax, 32       ; Ajouter 32 pour convertir en minuscule
    jmp .check_r8     ; Passer à .check_r8

.lower_r8:
    cmp r8b, "A"      ; Comparer avec 'A'
    jge .addicant_r8  ; Si supérieur ou égal à 'A', passer à .addicant_r8
    jmp .check_diff   ; Sinon, passer à .check_diff

.addicant_r8:
    add r8, 32        ; Ajouter 32 pour convertir en minuscule
    jmp .check_diff   ; Passer à .check_diff

.end:
    ret
