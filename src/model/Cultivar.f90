module cultivar
    implicit none
    real, public :: coeff_cult_sowing_emergence
    real, public :: coeff_cult_emergence_spikelet
    real, public :: coeff_cult_spikelet_grain
    real, public :: coeff_cult_grain_maturity
    real, public :: dvs_emergency_phase
    real, public :: dvs_drilling_phase
    real, public :: dvs_double_ring_phase
    real, public :: dvs_terminal_spikelet_phase
    real, public :: dvs_stem_elongation_phase
    real, public :: dvs_flag_sheet_phase
    real, public :: dvs_rubberization_phase
    real, public :: dvs_anthesis_phase
    real, public :: dvs_maturity_phase
contains

    subroutine senna()
        coeff_cult_sowing_emergence = 0.2105
        coeff_cult_emergence_spikelet = 0.0289
        coeff_cult_spikelet_grain = 0.0408
        coeff_cult_grain_maturity = 0.0691
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.27
        dvs_double_ring_phase = 0.27
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.55
        dvs_flag_sheet_phase = 0.75
        dvs_rubberization_phase = 0.85
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine astro()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0219
        coeff_cult_spikelet_grain = 0.0398
        coeff_cult_grain_maturity = 0.0665
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.21
        dvs_double_ring_phase = 0.27
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.53
        dvs_flag_sheet_phase = 0.75
        dvs_rubberization_phase = 0.85
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine calibre()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0239
        coeff_cult_spikelet_grain = 0.0395
        coeff_cult_grain_maturity = 0.0661
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.19
        dvs_double_ring_phase = 0.25
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.55
        dvs_flag_sheet_phase = 0.73
        dvs_rubberization_phase = 0.82
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine audaz()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0239
        coeff_cult_spikelet_grain = 0.0395
        coeff_cult_grain_maturity = 0.0661
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.24
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.57
        dvs_flag_sheet_phase = 0.70
        dvs_rubberization_phase = 0.79
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine duque()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0206
        coeff_cult_spikelet_grain = 0.0375
        coeff_cult_grain_maturity = 0.0654
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.27
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.45
        dvs_flag_sheet_phase = 0.69
        dvs_rubberization_phase = 0.78
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine trunfo()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0206
        coeff_cult_spikelet_grain = 0.0375
        coeff_cult_grain_maturity = 0.0654
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.17
        dvs_double_ring_phase = 0.27
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.48
        dvs_flag_sheet_phase = 0.68
        dvs_rubberization_phase = 0.82
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine agile()
        coeff_cult_sowing_emergence = 0.2102
        coeff_cult_emergence_spikelet = 0.0204
        coeff_cult_spikelet_grain = 0.0372
        coeff_cult_grain_maturity = 0.0648
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine feroz()
        coeff_cult_sowing_emergence = 0.2105
        coeff_cult_emergence_spikelet = 0.0201
        coeff_cult_spikelet_grain = 0.0390
        coeff_cult_grain_maturity = 0.0639
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.19
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.52
        dvs_flag_sheet_phase = 0.72
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine aton()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0210
        coeff_cult_spikelet_grain = 0.0328
        coeff_cult_grain_maturity = 0.0648
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.51
        dvs_flag_sheet_phase = 0.72
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine toruk()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0199
        coeff_cult_spikelet_grain = 0.0337
        coeff_cult_grain_maturity = 0.0647
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.19
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.49
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.82
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine one_four_zero_three()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0199
        coeff_cult_spikelet_grain = 0.0337
        coeff_cult_grain_maturity = 0.0647
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine premium()
        coeff_cult_sowing_emergence = 0.2103
        coeff_cult_emergence_spikelet = 0.0205
        coeff_cult_spikelet_grain = 0.0333
        coeff_cult_grain_maturity = 0.0645
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine ponteiro()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0189
        coeff_cult_spikelet_grain = 0.0305
        coeff_cult_grain_maturity = 0.0625
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.22
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine superprecoce()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0229
        coeff_cult_spikelet_grain = 0.0397
        coeff_cult_grain_maturity = 0.0658
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.53
        dvs_flag_sheet_phase = 0.74
        dvs_rubberization_phase = 0.84
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine precoce()
        coeff_cult_sowing_emergence = 0.2102
        coeff_cult_emergence_spikelet = 0.0204
        coeff_cult_spikelet_grain = 0.0372
        coeff_cult_grain_maturity = 0.0648
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.48
        dvs_flag_sheet_phase = 0.70
        dvs_rubberization_phase = 0.80
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine medio()
        coeff_cult_sowing_emergence = 0.2103
        coeff_cult_emergence_spikelet = 0.0205
        coeff_cult_spikelet_grain = 0.0333
        coeff_cult_grain_maturity = 0.0645
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.20
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.82
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

    subroutine tardio()
        coeff_cult_sowing_emergence = 0.2101
        coeff_cult_emergence_spikelet = 0.0189
        coeff_cult_spikelet_grain = 0.0305
        coeff_cult_grain_maturity = 0.0625
        dvs_emergency_phase = 0
        dvs_drilling_phase = 0.22
        dvs_double_ring_phase = 0.26
        dvs_terminal_spikelet_phase = 0.4
        dvs_stem_elongation_phase = 0.50
        dvs_flag_sheet_phase = 0.71
        dvs_rubberization_phase = 0.81
        dvs_anthesis_phase = 1
        dvs_maturity_phase = 2
    end subroutine

end module cultivar