program rk4
    use integrators_mod, only: rk4_step, backward_euler_step
    use odes_mod, only: damped_harmonic_oscillator
    implicit none

    integer :: steps, i, unit_csv
    real(8) :: t, t_end, dt
    real(8) :: y(2)
    type(damped_harmonic_oscillator) :: dho
    dho%zeta = 0.1
    dho%omega_0 = 2 * atan(1.0)
    t = 0
    y = [0.1, 0.0]
    t_end = 64 * atan(1.0)
    dt = 0.01
    steps = int((t_end - t)/dt)

    i = 1
    open(newunit=unit_csv, file="../analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, y(0), y(1)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0)') t, y(1), y(2)
        call rk4_step(y, t, dt, dho)
        ! print *, t, y(1), y(2)
        t = t + dt
    end do

end program