section .data
    prompt_n       db "Введите количество чисел (n): ", 0
    prompt_numbers db "Введите числа через пробел или Enter: ", 0
    result_msg     db "Сумма цифр, делящихся на 3: ", 0
    completion_msg db 10, "Все числа обработаны. Программа завершена.", 10, 0
    format_int     db "%d", 0
    newline        db 10, 0

section .bss
    n         resd 1
    num       resd 1
    sum       resd 1
    i         resd 1

section .text
    global main
    extern printf
    extern scanf

; Функция для подсчета суммы цифр, делящихся на 3, в числе
; Вход: EDI - число
; Выход: EAX - сумма цифр, делящихся на 3
sumDigitsDivBy3:
    push rbp
    mov rbp, rsp
    sub rsp, 16             ; Выделяем место под локальные переменные
    push rbx                ; Сохраняем EBX

    mov dword [rbp-4], 0    ; Инициализация локальной суммы = 0
    mov eax, edi            ; EAX = входное число
    mov [rbp-8], eax        ; Сохраняем число на стеке (для взятия модуля и как временное)

    ; Обрабатываем отрицательные числа
    cmp eax, 0
    jge .process_digits_loop
    neg dword [rbp-8]        ; Делаем число положительным на стеке
    mov eax, [rbp-8]         ; Загружаем положительное число в EAX

.process_digits_loop:
    cmp eax, 0              ; Если число == 0, цифры кончились
    je .end_sum

    ; Получаем последнюю цифру и число/10
    cdq                     ; Расширяем знак EAX в EDX:EAX (для idiv)
    mov ecx, 10             ; Делитель = 10
    idiv ecx                ; EAX = число / 10, EDX = последняя цифра

    ; Сохраняем цифру и новое число
    mov ebx, edx            ; Сохраняем цифру в EBX
    mov [rbp-8], eax        ; Сохраняем число/10 на стеке

    ; Проверяем, делится ли цифра (в EBX) на 3
    mov eax, ebx            ; Перемещаем цифру в EAX для деления
    xor edx, edx            ; Обнуляем EDX (т.к. цифра >= 0)
    mov ecx, 3              ; Делитель = 3
    div ecx                 ; Беззнаковое деление: EAX = цифра/3, EDX = цифра%3

    cmp edx, 0              ; Остаток равен 0?
    jne .next_digit         ; Если нет (остаток != 0), переходим к след. цифре

    ; Если делится на 3 (остаток == 0), добавляем цифру к сумме
    add [rbp-4], ebx        ; Добавляем ОРИГИНАЛЬНУЮ цифру (из EBX)

.next_digit:
    ; Загружаем число/10 для следующей итерации
    mov eax, [rbp-8]
    jmp .process_digits_loop ; Продолжаем цикл

.end_sum:
    mov eax, [rbp-4]        ; Помещаем результат (локальную сумму) в EAX
    pop rbx                 ; Восстанавливаем EBX
    leave                   ; Восстанавливаем RBP и RSP
    ret                     ; Возврат из функции

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16             ; Выравнивание стека / место для переменных (если нужно)

    ; Вывод "Введите количество чисел (n): "
    mov rdi, prompt_n
    xor eax, eax
    call printf

    ; Ввод n
    mov rdi, format_int
    mov rsi, n
    xor eax, eax
    call scanf
    ; TODO: Проверка scanf на ошибки

    ; Вывод приглашения для ввода чисел
    mov rdi, prompt_numbers
    xor eax, eax
    call printf

    ; Инициализация общей суммы
    mov dword [sum], 0

    ; Инициализация счетчика цикла
    mov dword [i], 0

.input_loop:
    mov eax, [i]
    cmp eax, [n]
    jge .loop_end

    ; Ввод очередного числа
    mov rdi, format_int
    mov rsi, num
    xor eax, eax
    call scanf
    ; TODO: Проверка scanf на ошибки

    ; Вызов sumDigitsDivBy3
    mov edi, [num]
    call sumDigitsDivBy3    ; Результат в EAX

    ; Добавляем результат к общей сумме
    add [sum], eax

    inc dword [i]
    jmp .input_loop

.loop_end:
    ; Вывод результата
    mov rdi, result_msg
    xor eax, eax
    call printf

    mov rdi, format_int
    mov esi, [sum]          ; Передаем значение общей суммы
    xor eax, eax
    call printf

    ; Вывод новой строки
    mov rdi, newline
    xor eax, eax
    call printf

    ; Вывод сообщения о завершении
    mov rdi, completion_msg
    xor eax, eax
    call printf

    ; Выход
    xor eax, eax
    leave
    ret

