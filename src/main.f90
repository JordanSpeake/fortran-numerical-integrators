program rk4
    use integrators, only: rk4_explicit_38_step, rk4_explicit_standard_step, backward_euler_fpi
    use odes, only: exponential_decay, harmonic_oscillator
    implicit none

    integer :: steps, i, unit_csv
    real(8) :: t, t_end, dt
    real(8) :: y_rk4(2), y_bwe(2)
    i = 1
    t = 0
    y_rk4 = [0, 1] ! RK (4)
    y_bwe = [0, 1] ! Backwards Euler
    t_end = 64 * atan(1.0) ! 2*pi
    dt = 0.1
    steps = int((t_end - t)/dt)

    open(newunit=unit_csv, file="analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (standard)[0], rk4 (standard)[1], rk4 (3/8)[0], rk4 (3/8)[1], be[0], be[1]"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0, ",", g0, ",", g0)') &
            t, y_rk4(1), y_rk4(2), y_bwe(1), y_bwe(2)
        call rk4_explicit_38_step(y_rk4, t, dt, harmonic_oscillator)
        call backward_euler_fpi(y_bwe, t, dt, harmonic_oscillator)
        t = t + dt
    end do

end program