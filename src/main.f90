program rk4
    use integrators_mod, only: rk4_step, backward_euler_step
    ! use damped_harmonic_oscillator_mod, only: damped_harmonic_oscillator
    use lotka_volterra_mod, only: lotka_volterra
    implicit none

    integer :: steps, i, unit_csv
    real(8) :: t, t_end, dt
    real(8) :: y(2)
    type(lotka_volterra) :: lk_model
    lk_model%alpha = 1.1
    lk_model%beta = 0.4
    lk_model%gamma = 0.1
    lk_model%delta = 0.4
    t = 0
    y = [0.9, 1.1]
    t_end = 64 * atan(1.0)
    dt = 0.01
    steps = int((t_end - t)/dt)

    i = 1
    open(newunit=unit_csv, file="../analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, y(0), y(1)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0)') t, y(1), y(2)
        call rk4_step(y, t, dt, lk_model)
        ! print *, t, y(1), y(2)
        t = t + dt
    end do

end program