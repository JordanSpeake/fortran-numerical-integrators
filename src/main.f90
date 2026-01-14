program rk4
    use integrators, only: rk4_explicit_38_step, rk4_explicit_standard_step
    use odes, only: sin_diffeq, exponential_decay, decaying_harmonic_oscillator
    implicit none

    ! Setup
    integer :: steps, i, unit_csv
    real(8) :: t, t_end, y_rk4_standard, y_rk4_alt, dt
    i = 1
    t = 0
    y_rk4_standard = 1
    y_rk4_alt = 1
    t_end = 8 * atan(1.0) ! 2*pi
    dt = 1
    steps = int((t_end - t)/dt)

    open(newunit=unit_csv, file="analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (standard), rk4 (3/8)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0)') t, y_rk4_standard ,y_rk4_alt
        call rk4_explicit_38_step(y_rk4_standard, t, dt, decaying_harmonic_oscillator)
        call rk4_explicit_standard_step(y_rk4_alt, t, dt, decaying_harmonic_oscillator)
        t = t + dt
    end do

    contains

end program