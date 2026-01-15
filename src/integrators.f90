module integrators
    use odes, only: ode_func
    implicit none
    private

    public :: rk4_explicit_38_step, rk4_explicit_standard_step, backward_euler_fpi

    contains

    pure subroutine rk4_explicit_38_step(y, t, dt, f)
    ! Runge-Kutta 4th order using alternative (1/8) weights, a bit better than the standard
        real(8), intent(inout) :: y(:)
        real(8), intent(in) :: t, dt
        procedure(ode_func) :: f
        real(8) :: k1(size(y)), k2(size(y)), k3(size(y)), k4(size(y))

        k1 = f(t,          y            )
        k2 = f(t + dt/3,   y + dt*k1/3  )
        k3 = f(t + 2*dt/3, y + dt*2*k2/3)
        k4 = f(t + dt,     y + dt*k3    )
        y = y + dt * (k1 + 3*k2 + 3*k3 + k4) / 8

    end subroutine rk4_explicit_38_step

    pure subroutine rk4_explicit_standard_step(y, t, dt, f)
    ! Runge-Kutta 4th order using standard (1/6) weights
        real(8), intent(inout) :: y(:)
        real(8), intent(in) :: t, dt
        procedure(ode_func) :: f
        real(8) :: k1(size(y)), k2(size(y)), k3(size(y)), k4(size(y))

        k1 = f(t,        y          )
        k2 = f(t + dt/2, y + dt*k1/2)
        k3 = f(t + dt/2, y + dt*k2/2)
        k4 = f(t + dt,   y + dt*k3  )
        y = y + dt * (k1 + 2*k2 + 2*k3 + k4) / 6
    end subroutine rk4_explicit_standard_step

    pure subroutine backward_euler_fpi(y, t, dt, f)
        ! Backwards Euler using Fixed Point Iteration
        real(8), intent(inout) :: y(:)
        real(8), intent(in) :: t, dt
        procedure(ode_func) :: f
        real(8) :: y_in(size(y)), y_prev(size(y))
        integer :: i

        y_in = y
        y_prev = y

        do i = 1, 50
            y = y_in + dt*f(t+dt, y_prev)
            if (minval(abs(y - y_prev)) < 0.0001) exit
            y_prev = y
        end do


    end subroutine backward_euler_fpi

end module integrators