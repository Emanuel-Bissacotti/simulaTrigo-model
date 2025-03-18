module meteorology
    implicit none
    integer, parameter, public :: meteorology_columns = 5
    real, target, allocatable, public :: meteorology_table(:, :)
    real, pointer, public :: year(:) => null()
    real, pointer, public :: day_of_year(:) => null()
    real, pointer, public :: min_temp(:) => null()
    real, pointer, public :: max_temp(:) => null()
    real, pointer, public :: mean_temp(:) => null()

    public :: map_meteorology
    public :: clean_meteorology
contains

    subroutine map_meteorology()
        year => meteorology_table(:, 1)
        day_of_year => meteorology_table(:, 2)
        min_temp => meteorology_table(:, 3)
        max_temp => meteorology_table(:, 4)
        mean_temp => meteorology_table(:, 5)
    end subroutine

    subroutine clean_meteorology()
        year => null()
        day_of_year => null()
        min_temp => null()
        max_temp => null()
        mean_temp => null()
        deallocate(meteorology_table)
    end subroutine
    
end module meteorology