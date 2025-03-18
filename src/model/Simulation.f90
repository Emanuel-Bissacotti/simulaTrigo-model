module simulation
    use meteorology
    use results
    use IO
    use coefficients
    use cultivar
    use parameters
    implicit none
    logical :: sowing_phase
    logical :: emergency_phase
    logical :: drilling_phase
    logical :: double_ring_phase
    logical :: terminal_spikelet_phase
    logical :: stem_elongation_phase
    logical :: flag_sheet_phase
    logical :: rubberization_phase
    logical :: anthesis_phase
    logical :: maturity_phase
contains

    subroutine simulate()
        integer :: day
        day = 1
        call fill_pre_simulation()
        do while (day <= size(meteorology_table, 1))
            if (maturity_phase) exit
            call simulation_day(day)
            day = day + 1
        end do
        if(simulation_end_line == 0) then
            simulation_end_line = day - 1
        end if
        call write_date_in_output_file()
    end subroutine

    subroutine fill_pre_simulation()
        sowing_phase = .true.
        emergency_phase = .false.
        drilling_phase = .false.
        double_ring_phase = .false.
        terminal_spikelet_phase = .false.
        stem_elongation_phase = .false.
        flag_sheet_phase = .false.
        rubberization_phase = .false.
        anthesis_phase = .false.
        maturity_phase = .false.
        call coeff_cultivare()
    end subroutine

    subroutine simulation_day(day)
        integer :: day
        integer :: coeff(3)
        real :: alpha
        real :: coeff_cult
        call pre_simulation_day(day)
        if (simulation_start_line > 0) then
            if (sowing_phase) then
                coeff = coeff_sowing_emergence
                alpha = alpha_sowing_emergence
                coeff_cult = coeff_cult_sowing_emergence
            else if ( &
                emergency_phase .OR. &
                drilling_phase .OR. &
                double_ring_phase &
            ) then
                coeff = coeff_emergence_spikelet
                alpha = alpha_emergence_spikelet
                coeff_cult = coeff_cult_emergence_spikelet
            else if ( &
                terminal_spikelet_phase .OR. &
                stem_elongation_phase .OR. &
                flag_sheet_phase .OR. &
                rubberization_phase &
            ) then
                coeff = coeff_spikelet_grain
                alpha = alpha_spikelet_grain
                coeff_cult = coeff_cult_spikelet_grain
            else if (anthesis_phase) then
                coeff = coeff_grain_maturity
                alpha = alpha_grain_maturity
                coeff_cult = coeff_cult_grain_maturity
            end if
            call min_temp_func_calc(day, coeff, alpha)
            call max_temp_func_calc(day, coeff, alpha)
            call mean_temp_func_calc(day)
            call max_development_rate_calc(day, coeff_cult)
            call development_stage_calc(day)
            call post_simulation_day(day)
        end if
    end subroutine

    subroutine pre_simulation_day(day)
        integer :: day
        if ((year(day) == sowing_year) .AND. (day_of_year(day) == sowing_date)) then
            simulation_start_line = day
        end if
    end subroutine

    subroutine post_simulation_day(day)
        integer :: day
        if ( &
            .NOT. emergency_phase .AND. development_stage(day) >= dvs_emergency_phase .AND. &
            development_stage(day) < dvs_drilling_phase &
        ) then
            sowing_phase = .false.
            emergency_phase = .true.
            emergency_date = day - simulation_start_line + 1
        else if ( &
            .NOT. drilling_phase .AND. development_stage(day) >= dvs_drilling_phase .AND. &
            development_stage(day) < dvs_double_ring_phase .OR. &
            (type_cultivar == 1 .AND. .NOT. drilling_phase .AND. .NOT. double_ring_phase .AND. &
            development_stage(day) >= dvs_drilling_phase .AND. &
            development_stage(day) < dvs_stem_elongation_phase) &
        ) then
            emergency_phase = .false.
            drilling_phase = .true.
            drilling_date = day - simulation_start_line + 1
            if (type_cultivar == 1) then
                double_ring_phase = .true.
                double_ring_date = drilling_date
            end if
        else if ( &
            .NOT. double_ring_phase .AND. development_stage(day) >= dvs_double_ring_phase .AND. &
            development_stage(day) < dvs_terminal_spikelet_phase .AND. (.NOT. type_cultivar == 1) &
        ) then
            drilling_phase = .false.
            double_ring_phase = .true.
            double_ring_date = day - simulation_start_line + 1
        else if ( &
            .NOT. terminal_spikelet_phase .AND. development_stage(day) >= dvs_terminal_spikelet_phase .AND. &
            development_stage(day) < dvs_stem_elongation_phase &
        ) then
            double_ring_phase = .false.
            terminal_spikelet_phase = .true.
            terminal_spikelet_date = day - simulation_start_line + 1
            if (type_cultivar == 1) then
                double_ring_phase = .false.
            end if
        else if ( &
            .NOT. stem_elongation_phase .AND. development_stage(day) >= dvs_stem_elongation_phase .AND. &
            development_stage(day) < dvs_flag_sheet_phase &
        ) then
            terminal_spikelet_phase = .false.
            stem_elongation_phase = .true.
            stem_elongation_date = day - simulation_start_line + 1
        else if ( &
            .NOT. flag_sheet_phase .AND. development_stage(day) >= dvs_flag_sheet_phase .AND. &
            development_stage(day) < dvs_rubberization_phase &
        ) then
            stem_elongation_phase = .false.
            flag_sheet_phase = .true.
            flag_sheet_date = day - simulation_start_line + 1
        else if ( &
            .NOT. rubberization_phase .AND. development_stage(day) >= dvs_rubberization_phase .AND. &
            development_stage(day) < dvs_anthesis_phase &
        ) then
            flag_sheet_phase = .false.
            rubberization_phase = .true.
            rubberization_date = day - simulation_start_line + 1
        else if ( &
            .NOT. anthesis_phase .AND. development_stage(day) >= dvs_anthesis_phase .AND. &
            development_stage(day) < dvs_maturity_phase &
        ) then
            rubberization_phase = .false.
            anthesis_phase = .true.
            anthesis_date = day - simulation_start_line + 1
        else if (.NOT. maturity_phase .AND. development_stage(day) >= dvs_maturity_phase) then
            anthesis_phase = .false.
            maturity_phase = .true.
            maturity_date = day - simulation_start_line + 1
            simulation_end_line = day
        end if
    end subroutine

    subroutine min_temp_func_calc(day, coeff, alpha)
        integer :: day
        integer, dimension(3) :: coeff
        real :: alpha

        if (min_temp(day) > coeff(1)) then
            min_temp_func(day) = (2 * ((min_temp(day) - coeff(1)) ** (alpha)) * &
                    ((coeff(2) - coeff(1)) ** (alpha)) - &
                    ((min_temp(day) - coeff(1)) ** (2 * alpha)) &
            ) / ((coeff(2) - coeff(1)) ** (2 * alpha)) 
        else
            min_temp_func(day) = 0
        end if
    end subroutine

    subroutine max_temp_func_calc(day, coeff, alpha)
        integer :: day
        integer, dimension(3) :: coeff
        real :: alpha

        if (max_temp(day) > coeff(1)) then
            max_temp_func(day) = (2 * ((max_temp(day) - coeff(1)) ** (alpha)) * &
                    ((coeff(2) - coeff(1)) ** (alpha)) - &
                    ((max_temp(day) - coeff(1)) ** (2 * alpha)) &
            ) / ((coeff(2) - coeff(1)) ** (2 * alpha)) 
        else
            max_temp_func(day) = 0
        end if
    end subroutine

    subroutine mean_temp_func_calc(day)
        integer :: day

        mean_temp_func(day) = ( &
            min_temp_func(day) + max_temp_func(day) &
        ) / 2
    end subroutine

    subroutine max_development_rate_calc(day, coeff_cult)
        integer :: day
        real :: coeff_cult
        max_development_rate(day) = coeff_cult * mean_temp_func(day)
    end subroutine

    subroutine development_stage_calc(day)
        integer :: day
        if (simulation_start_line == day) then
            development_stage(1) = -1
        else 
            development_stage(day) = development_stage(day-1) + max_development_rate(day)
        end if
    end subroutine
    
end module simulation