INCLUDE Irvine32.inc
.data
Array1 DWORD 20, 40, 60, 80, 100   
Array2 DWORD 5 DUP(?)             ; Destination array (initially empty)
array1Msg BYTE "Array1: ", 0       
array2Msg BYTE "Array2: ", 0       

.code
main PROC
   
    mov esi, OFFSET Array1       ; Load address of Array1 into ESI (source array)
    mov edi, OFFSET Array2       ; Load address of Array2 into EDI (destination array)
    mov ecx, 5                   ; Set ECX to 5 (number of elements in the arrays)
copy_elements:
    mov eax, [esi]               ; Load value from Array1 (pointed by ESI) into EAX
    mov [edi], eax               ; Store value from EAX into Array2 (pointed by EDI)
    add esi, 4                   ; Move to the next element in Array1 (DWORD = 4 bytes)
    add edi, 4                   ; Move to the next element in Array2 (DWORD = 4 bytes)
    loop copy_elements           ; Repeat 
    ; Print Array1 message
    lea edx, array1Msg           ; Load address of "Array1: " message
    call WriteString             
    call Crlf                   
    
    ; Print Array1 values
    lea esi, Array1
    mov ecx, 5
print_array1:
    mov eax, [esi]               ; Load value from Array1
    call WriteDec                
    call Crlf                    
    add esi, 4                  
    loop print_array1
    call Crlf                    

    ; Print Array2 message
    lea edx, array2Msg           ; Load address of "Array2: " message
    call WriteString             
    call Crlf                    

    ; Print Array2 values
    lea esi, Array2
    mov ecx, 5
print_array2:
    mov eax, [esi]               ; Load value from Array2
    call WriteDec                
    call Crlf                    
    add esi, 4                   
    loop print_array2
    exit                         
main ENDP
END main
