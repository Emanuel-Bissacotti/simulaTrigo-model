module coefficients
    use cultivar
    use parameters
    implicit none
    integer, parameter, public :: coeff_sowing_emergence(3) = [0, 24, 35] 
    integer, parameter, public :: coeff_emergence_spikelet(3) = [0, 24, 35]
    integer, parameter, public :: coeff_spikelet_grain(3) = [4, 30, 40]
    integer, parameter, public :: coeff_grain_maturity(3) = [8, 30, 40]
    real, parameter, public :: alpha_sowing_emergence = 1.837
    real, parameter, public :: alpha_emergence_spikelet = 1.837
    real, parameter, public :: alpha_spikelet_grain = 2.130
    real, parameter, public :: alpha_grain_maturity = 1.850

    public :: coeff_cultivare
contains

    subroutine coeff_cultivare()
        select case (type_cultivar)
            case (1); call senna()
            case (2); call astro()
            case (3); call calibre()
            case (4); call audaz()
            case (5); call duque()
            case (6); call trunfo()
            case (7); call agile()
            case (8); call feroz()
            case (9);  call aton()
            case (10); call toruk()
            case (11); call one_four_zero_three()
            case (12); call premium()
            case (13); call ponteiro()
            case (14); call superprecoce()
            case (15); call precoce()
            case (16); call medio()
            case (17); call tardio()
        end select
    end subroutine
end module coefficients