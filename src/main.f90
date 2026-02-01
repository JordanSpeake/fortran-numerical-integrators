program rk4
    use integrators_mod, only: rkf4_step
    ! use damped_harmonic_oscillator_mod, only: damped_harmonic_oscillator
    use van_der_pol_oscillator_mod, only: van_der_pol_oscillator
    ! use lotka_volterra_mod, only: lotka_volterra
    implicit none

    ! Setup:
    integer :: i, unit_csv, step
    real(8) :: t, t_end, dt, tol
    real(8) :: y(2)
    type(van_der_pol_oscillator) :: vdpo_model
    vdpo_model%mu = 5
    t = 0
    y = [0.0, 1.0]
    t_end = 20
    tol = 1e-6
    dt = 0.1 ! Starting value for tol
    i = 1
    step = 0

    ! Run the solver:
    write(*, fmt="(a)", advance="no") "Running solver..."
    open(newunit=unit_csv, file="analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, y(0), y(1)"
    print *, "Starting"
    do while (t < t_end)
        write(unit_csv, '(g0, ",", g0, ",", g0)') t, y(1), y(2)
        call rkf4_step(y, t, tol, dt, vdpo_model)
        t = t + dt
        step = step + 1
    end do
    print *, "Done in ", step, " steps."

end program