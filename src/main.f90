program rk4
    use integrators, only: rk4_step
    use odes, only: sin_diffeq
    implicit none

    ! Setup
    integer :: steps, i, unit_csv
    real(8) :: t, t_end, y, dt
    i = 1
    t = 0
    y = -1
    t_end = 8 * atan(1.0) ! 2*pi
    dt = 0.1
    steps = int((t_end - t)/dt)

    open(newunit=unit_csv, file="analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (explicit)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0)') t, y
        call rk4_step(y, t, dt, sin_diffeq)
        t = t + dt
    end do

    contains

end program