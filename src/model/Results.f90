module results
    implicit none
    integer, parameter, public :: results_list_len = 9
    real, target, public :: results_list(results_list_len)
    real, pointer, public :: emergency_date => results_list(1)
    real, pointer, public :: drilling_date => results_list(2)
    real, pointer, public :: double_ring_date => results_list(3)
    real, pointer, public :: terminal_spikelet_date => results_list(4)
    real, pointer, public :: stem_elongation_date => results_list(5)
    real, pointer, public :: flag_sheet_date => results_list(6)
    real, pointer, public :: rubberization_date => results_list(7)
    real, pointer, public :: anthesis_date => results_list(8)
    real, pointer, public :: maturity_date => results_list(9)

    integer, parameter, public :: results_columns = 5
    real, target, allocatable, public :: results_table(:, :)
    real, pointer, public :: min_temp_func(:) => null ()
    real, pointer, public :: max_temp_func(:) => null ()
    real, pointer, public :: mean_temp_func(:) => null()
    real, pointer, public :: max_development_rate(:) => null ()
    real, pointer, public :: development_stage(:) => null ()
contains

    subroutine map_result()
        results_list(:) = 0.0
        results_table(:, :) = 0.0
        max_temp_func => results_table(:, 1)
        min_temp_func => results_table(:, 2)
        mean_temp_func => results_table(:, 3)
        max_development_rate => results_table(:, 4)
        development_stage => results_table(:, 5)
    end subroutine

    subroutine clean_results()
        max_temp_func => null ()
        min_temp_func => null ()
        mean_temp_func => null ()
        max_development_rate => null ()
        development_stage => null ()
        deallocate(results_table)
    end subroutine
end module results