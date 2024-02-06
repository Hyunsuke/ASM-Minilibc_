section .text
global strchr

strchr:
    mov     rcx, 0
    mov     al, byte [rsi]

search_loop:
    cmp     byte [rdi + rcx], al
        je      found                 ; Si égal, aller à l'étiquette found
    cmp     byte [rdi + rcx], 0   ; Comparer avec le caractère nul (fin de la chaîne)
        je      not_found             ; Si égal, aller à l'étiquette not_found
    inc     rcx                   ; Incrémenter l'index
    jmp     search_loop           ; Revenir au début de la boucle

found:
    mov     rax, rdi              ; Charger l'adresse de la chaîne dans rax
    add     rax, rcx              ; Ajouter l'index à l'adresse de la chaîne
    ret

not_found:
    ; Le caractère n'a pas été trouvé
    ; Retourner NULL
    xor     rax, rax              ; Mettre rax à zéro (NULL)
    ret                           ; Retourner NULL