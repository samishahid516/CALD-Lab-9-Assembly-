INCLUDE Irvine32.inc
.data
array DWORD 10, 20, 30, 40, 50           ; Array 
sum DWORD 0                              ; Variable to store the sum
average DWORD 0                          ; Variable to store the average
sumMsg BYTE "Sum of Array: ", 0          ; Message 
avgMsg BYTE "Average of Array: ", 0      ; Message 

.code
main PROC
    mov esi, OFFSET array                ; Load address into ESI
    mov ecx, 5                           ; Elements in rray
    xor eax, eax                         ; Clear EAX to store the sum

calculate_sum:
    add eax, [esi]                       ; Add the current element to EAX
    add esi, 4                           ; Move to the next element (DWORD = 4 bytes)
    loop calculate_sum                   ; loop

    mov sum, eax

    ; Calculate average
    mov ebx, 5                          ; EBX = number of elements
    xor edx, edx                        ; Clear EDX for division
    div ebx                             ; EAX = sum / number of elements
    mov average, eax                    ; Store the average in 'average'

    ; Print the sum
    lea edx, sumMsg                     ; Load address of "Sum: " message
    call WriteString                    ; Print message
    mov eax, sum                        ; Load the sum value
    call WriteDec                       
    call Crlf                           

    ; Print the average
    lea edx, avgMsg                     
    call WriteString                    
    mov eax, average                    
    call WriteDec               
    call Crlf                   

    exit                        
main ENDP
END main                        