program program
    use io
    use meteorology
    use simulation 
    use parser
    use results

    implicit none
    call parse()
    call activate_io()
    call read_data_from_input_file()
    call simulate()
    print*, emergency_date
    print*, drilling_date
    print*, double_ring_date
    print*, terminal_spikelet_date
    print*, stem_elongation_date
    print*, flag_sheet_date
    print*, rubberization_date
    print*, anthesis_date
    print*, maturity_date
end program program