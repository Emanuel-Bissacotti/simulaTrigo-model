module io
    use meteorology
    use results
    use utils
    implicit none

    integer, public :: simulation_start_line, simulation_end_line
    character(len=500), public :: input_file = 'entrada.csv'
    character(len=500), public :: output_file = 'saida.csv'

    public :: activate_io
    public :: read_data_from_input_file
contains

    subroutine activate_io()
        call init_input_file()
        allocate(meteorology_table(file_countter(1) - 1, meteorology_columns))
        allocate(results_table(file_countter(1) - 1, results_columns))
        call map_meteorology()
        call map_result()
        call init_output_file()
        simulation_start_line = 0
        simulation_end_line = 0
    end subroutine

    subroutine init_input_file()
        integer :: io_error
        logical :: exist
        character(len=:), allocatable :: in_file
        in_file = trim(adjustl("../"//input_file))

        inquire(file=in_file, exist=exist)
        if (.not. exist) then
            print*, '"' // in_file // '" NÃO EXISTE.'
        end if
        open(1, file=in_file, status='old', action='read', iostat=io_error)
        if (access(in_file, 'r') /= 0) then
            print*, 'VOCÊ NÃO TEM PERMISSÃO PARA LER "' // in_file // '".'
        end if
        if (file_countter(1) <= 3) then
            print*,'"' // in_file // '" VAZIO.'         
        end if
    end subroutine

    subroutine read_data_from_input_file()
        integer :: i, io_error
        read(1, "(A)")
        do i = 1, size(meteorology_table, 1)
            read(1, *, iostat = io_error) year(i), day_of_year(i), min_temp(i), &
                max_temp(i) 
            mean_temp(i) = (min_temp(i) + max_temp(i)) / 2
        end do
        close(1)
    end subroutine
    
    subroutine write_header_in_output_file()
        write(2, '(A)') 'year,day_of_year,min_temp,max_temp,mean_temp,max_temp_func,' // &
            'min_temp_func,mean_temp_func,max_development_rate,development_stage'
    end subroutine

    subroutine write_date_in_output_file()
        integer :: i
        call write_header_in_output_file()
        do i=simulation_start_line, simulation_end_line
            write(2, '(*(F7.2, ","))', advance="no") meteorology_table(i, 1:)
            write(2, '(*(f8.4, ","))', advance="yes") results_table (i, 1:)
        end do
        close(2)
    end subroutine

    subroutine init_output_file()
        integer :: io_error
        character(len=:), allocatable :: out_file
        out_file = trim(adjustl(output_file))
        open(2, file=out_file, status='replace', action='write', iostat=io_error)
        if (access(out_file, 'w') /= 0) then
            print*, 'VOCÊ NÃO TEM PERMISSÃO PARA ESCREVER "' // out_file // '".'
        end if
    end subroutine
end module io