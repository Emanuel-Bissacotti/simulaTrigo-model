module parser
    use parameters
    use io
    implicit none
    
    integer :: arg_index = 0
    logical :: parameterized = .false.
    
    public  :: parse

contains

    subroutine parse()
        character (len=500) :: arg
        do while (arg_index < iargc())
            arg = parser_get_arg()
            select case (TRIM(arg))
            case ("-p", "--parameterized")
                call parse_parameterized_arg()
            case ("-o", "--output-file")
                call parse_output_arg()
            case ("-i", "--input-file")
                call parse_input_arg()
            case default
                print*, 'O ARGUMENTO "' // TRIM(arg) // '" NÃO EXISTE.'
                call exit
            end select
        end do
        if (.NOT. parameterized) then
            call read_input_from_keyboard()
        end if
    end subroutine

    subroutine parse_parameterized_arg()
        character (len=500) :: arg
        if (iargc() - arg_index < parameters_len) then
            call GETARG (arg_index, arg)
            print*, 'A quantidade de argumetos passados é insuficiente para a execução do modelo.'
            call EXIT()
        end if
        arg = parser_get_arg()
        read(arg, *) sowing_year
        arg = parser_get_arg()
        read(arg, *) sowing_date  
        arg = parser_get_arg()
        read(arg, *) type_cultivar
        parameterized = .true.
    end subroutine

    subroutine parse_output_arg()
        character (len=500) :: arg
        arg = parser_get_arg()
        output_file = arg
    end subroutine

    subroutine parse_input_arg() 
        character (len=500) :: arg
        arg = parser_get_arg()
        input_file = arg
    end subroutine

    subroutine read_input_from_keyboard ()
        print*, "INFORME O ANO DA SEMEADURA/EMERGÊNCIA (EX. 1998)"
        read*, sowing_year
        print*, "INFORME A DATA DE SEMEADURA/EMERGÊNCIA (DIA DO ANO)"
        read*, sowing_date
        print*, "PARA SELECIONAR A CULTIVAR(GMR) CULTIVADA, DIGITE O NÚMERO CORRESPONDENTE:"
        print*, "1 - SENNA"
        print*, "2 - ASTRO"
        print*, "3 - CALIBRE"
        print*, "4 - AUDAZ"
        print*, "5 - DUQUE"
        print*, "6 - TRUNFO"
        print*, "7 - AGILE"
        print*, "8 - FEROZ"
        print*, "9 - ATON"
        print*, "10 - TORUK"
        print*, "11 - 1403"
        print*, "12 - PREMIUM"
        print*, "13 - PONTEIRO"
        print*, "14 - SUPERPRECOCE"
        print*, "15 - PRECOCE"
        print*, "16 - MEDIA"
        print*, "17 - TARDIO"
        read*, type_cultivar
    end subroutine

    function parser_get_arg () result (arg)
        character (len=500) :: arg
        arg_index = arg_index + 1
        call GETARG (arg_index, arg)
    end function 

end module parser