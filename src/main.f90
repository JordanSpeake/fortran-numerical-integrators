program rk4
    use integrators_mod, only: rk4_step, backward_euler_step
    ! use damped_harmonic_oscillator_mod, only: damped_harmonic_oscillator
    use van_der_pol_oscillator_mod, only: van_der_pol_oscillator
    implicit none

    ! Setup:
    integer :: steps, i, unit_csv
    real(8) :: t, t_end, dt
    real(8) :: y(2)
    type(van_der_pol_oscillator) :: vdpo_model
    vdpo_model%mu = 50
    t = 0
    y = [0.0, 1.0]
    t_end = 200
    dt = 0.001
    steps = int((t_end - t)/dt)
    i = 1

    ! Run the solver:
    write(*, fmt="(a)", advance="no") "Running solver..."
    open(newunit=unit_csv, file="../analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, y(0), y(1)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0, ",", g0)') t, y(1), y(2)
        call rk4_step(y, t, dt, vdpo_model)
        t = t + dt
    end do
    print *, "Done."

end program