program rk4
    use integrators, only: rk4_step
    implicit none

    ! Setup
    integer :: steps, i, unit_csv
    real(8) :: t, t_end, y, dt
    i = 1
    t = 0
    y = -1
    t_end = 8 * atan(1.0) ! 2*pi
    dt = 0.0001
    steps = int((t_end - t)/dt)

    open(newunit=unit_csv, file="../analysis/data.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (explicit)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0)') t, y
        call rk4_step(y, t, dt, func)
        t = t + dt
    end do

    contains

    pure function func(t, y) result(out)
        ! This defines the function to be integrated
        real(8), intent(in) :: t, y
        real(8) :: out
        out = sin(t) + (0 * y)
    end function

    ! pure function rk_step(y0, t0, h) result(y1)
    !     implicit none
    !     real(8), intent(in) :: y0, t0, h
    !     real(8) :: k1, k2, k3, k4, y1
    !     k1 = func(t0,         y0           )
    !     k2 = func(t0 + h/3,   y0 + h*k1/3  )
    !     k3 = func(t0 + 2*h/3, y0 + h*2*k2/3)
    !     k4 = func(t0 + h,     y0 + h*k3    )
    !     y1 = y0 + h * (k1 + 3*k2 + 3*k3 + k4) / 8
    ! end function

end program