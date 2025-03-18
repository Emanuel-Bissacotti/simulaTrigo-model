module utils
    Use, intrinsic :: iso_fortran_env, Only : iostat_end
    implicit none
    
contains

    function file_countter(unit) result(count)
        integer :: unit, count, io_error
        count = 0
        rewind(unit)
        do 
            read(unit, *, iostat = io_error)
            if (io_error == iostat_end) then
                exit
            else if (io_error /= 0) then
                print *, "ERRO DESCONHECIDO, io_error:", io_error
            end if
            count = count + 1
        end do
        rewind(unit)
    end function

end module utils