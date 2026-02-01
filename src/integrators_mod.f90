module integrators_mod
    use models_mod, only: ode_model
    implicit none
    private

    public :: rkf4_step

    contains

    subroutine rkf4_step(y, t, tol, dt, model)
    ! Runge-Kutta 4th order using alternative (1/8) weights, a bit better than the standard
        real(8), intent(inout) :: y(:), dt
        real(8), intent(in) :: t, tol
        class(ode_model), intent(in) :: model
        real(8) :: k1(size(y)), k2(size(y)), k3(size(y)), k4(size(y)), k5(size(y)), k6(size(y))
        ! These values represent the Butcher Tableau for RKF4
        real(8), parameter :: A(6, 5) = reshape([ &
        0.0,            0.0,           0.0,           0.0,            0.0      , &
        1.0/4.0,        0.0,           0.0,           0.0,            0.0      , &
        3.0/32.0,       9.0/32.0,      0.0,           0.0,            0.0      , &
        1932.0/2197.0, -7200.0/2197.0, 7296.0/2197.0, 0.0,            0.0      , &
        439.0/216.0,   -8.0,           3680.0/513.0, -845.0/4104.0,   0.0      , &
        -8.0/27.0,      2.0,          -3544.0/2565.0, 1859.0/4104.0, -11.0/40.0  &
        ], [6, 5], order=[2, 1])
        real(8), parameter :: B(6) = [ &
            25.0/216.0, 0.0, 1408.0/2565.0,  2197.0/4104.0,   -1.0/5.0,  0.0]
        real(8), parameter :: B_hat(6) = [ &
            16.0/135.0, 0.0, 6656.0/12825.0, 28561.0/56430.0, -9.0/50.0, 2.0/55.0]
        real(8), parameter :: C(6) = [ &
            0.0, 1.0/4.0, 3.0/8.0, 12.0/13.0, 1.0, 1.0/3.0 &
        ]
        real(8) :: trunc_errs(size(y)), max_trunc_err
        max_trunc_err = tol * 2.0 ! Start max_trunc_error as above our tolerance

        do while (max_trunc_err .gt. tol)
            k1 = dt * model%f(t+c(1)*dt, y)
            k2 = dt * model%f(t+c(2)*dt, y + A(2, 1)*k1)
            k3 = dt * model%f(t+c(3)*dt, y + A(3, 1)*k1 + A(3, 2)*k2)
            k4 = dt * model%f(t+c(4)*dt, y + A(4, 1)*k1 + A(4, 2)*k2 + A(4, 3)*k3)
            k5 = dt * model%f(t+c(5)*dt, y + A(5, 1)*k1 + A(5, 2)*k2 + A(5, 3)*k3 + A(5, 4)*k4)
            k6 = dt * model%f(t+c(6)*dt, y + A(6, 1)*k1 + A(6, 2)*k2 + A(6, 3)*k3 + A(6, 4)*k4 + A(6, 5)*k5)
            trunc_errs = abs( &
                (b_hat(1)-b(1))*k1 + (b_hat(2)-b(2))*k2 + (b_hat(3)-b(3))*k3 &
              + (b_hat(4)-b(4))*k4 + (b_hat(5)-b(5))*k5 + (b_hat(6)-b(6))*k6)
            max_trunc_err = maxval(trunc_errs)
            dt = 0.9 * dt * ((tol/max_trunc_err)**0.2)
            if (dt <= 1e-15) then
                stop 1
            end if
        end do
            y = y + b_hat(1)*k1 + b_hat(2)*k2 + b_hat(3)*k3 + b_hat(4)*k4 + b_hat(5)*k5 + b_hat(6)*k6
    end subroutine rkf4_step
end module integrators_mod