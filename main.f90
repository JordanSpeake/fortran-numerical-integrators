program rk4
    use, intrinsic :: iso_fortran_env, only : dp => real64
    implicit none

    ! Setup
    integer :: steps, i, unit_csv
    real(dp) :: t_init, t_end, y_init, h
    real(dp), allocatable :: y_values(:), t_values(:)
    t_init = 0
    y_init = 1
    t_end = 1
    h = 0.001
    steps = int((t_end - t_init)/h)
    allocate(y_values(steps))
    y_values(1) = y_init
    allocate(t_values(steps))
    t_values(1) = t_init

    ! Do the integration
    do i = 1, steps
        y_values(i+1) = rk_step(y_values(i), t_values(i), h)
        t_values(i+1) = t_values(i) + h
    end do

    ! Write to a file
    i = 1
    open(newunit=unit_csv, file="out.csv", status="replace")
    write(unit_csv, '(A)') "t, rk4 (explicit)"
    do i = 1, steps
        write(unit_csv, '(g0, ",", g0)') t_values(i), y_values(i)
    end do

    contains

    pure function func(t, y) result(out)
        ! This defines the function to be integrated
        real(dp), intent(in) :: t, y
        real(dp) :: out
        out = -y*t
    end function

    pure function rk_step(y0, t0, h) result(y1)
        implicit none
        real(dp), intent(in) :: y0, t0, h
        real(dp) :: k1, k2, k3, k4, t1, y1
        t1 = t0
        k1 = func(t0,       y0         )
        k2 = func(t0 + h/2, y0 + h*k1/2)
        k3 = func(t0 + h/2, y0 + h*k2/2)
        k4 = func(t0 + h,   y0 + h*k3  )
        y1 = y0 + h * (k1 + k2/2 + k3/2 + k4) / 6
    end function

end program