module integrators
    use models, only: ode_model
    implicit none
    private

    public :: rk4_step, backward_euler_step

    contains

    pure subroutine rk4_step(y, t, dt, model)
    ! Runge-Kutta 4th order using alternative (1/8) weights, a bit better than the standard
        real(8), intent(inout) :: y(:)
        real(8), intent(in) :: t, dt
        class(ode_model), intent(in) :: model
        real(8) :: k1(size(y)), k2(size(y)), k3(size(y)), k4(size(y))

        k1 = model%f(t,          y            )
        k2 = model%f(t + dt/3,   y + dt*k1/3  )
        k3 = model%f(t + 2*dt/3, y + dt*2*k2/3)
        k4 = model%f(t + dt,     y + dt*k3    )
        y = y + dt * (k1 + 3*k2 + 3*k3 + k4) / 8

    end subroutine rk4_step

    pure subroutine backward_euler_step(y, t, dt, model)
        ! Backwards Euler using Fixed Point Iteration
        real(8), intent(inout) :: y(:)
        real(8), intent(in) :: t, dt
        class(ode_model), intent(in) :: model
        real(8) :: y_in(size(y)), y_prev(size(y))
        integer :: i

        y_in = y
        y_prev = y

        do i = 1, 50
            y = y_in + dt*model%f(t+dt, y_prev)
            if (minval(abs(y - y_prev)) < 0.0001) exit
            y_prev = y
        end do
    end subroutine backward_euler_step

end module integrators