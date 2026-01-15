program rk4
    use integrators, only: rk4_explicit_38_step, rk4_explicit_standard_step
    use odes, only: exponential_decay, decaying_harmonic_oscillator
    implicit none

    ! Setup
    integer :: steps, i, unit_csv
    real(8) :: t, t_end, dt
    real(8) :: y_rk4_standard(2), y_rk4_alt(2)
    i = 1
    t = 0
    y_rk4_standard = [0, 1]
    y_rk4_alt = [0, 1]
    t_end = 128 * atan(1.0) ! 2*pi
    dt = 0.01
    steps = int((t_end - t)/dt)

    open(newunit=unit_csv, file="analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (standard)[0], rk4 (standard)[1], rk4 (3/8)[0], rk4 (3/8)[1]"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0, ",", g0, ",", g0)') &
            t, y_rk4_standard(1), y_rk4_standard(2), y_rk4_alt(1), y_rk4_alt(2)
        call rk4_explicit_38_step(y_rk4_standard, t, dt, decaying_harmonic_oscillator)
        call rk4_explicit_standard_step(y_rk4_alt, t, dt, decaying_harmonic_oscillator)
        t = t + dt
    end do

end program