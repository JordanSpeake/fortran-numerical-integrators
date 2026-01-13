module integrators
    implicit none

    private

    public :: rk4_step, ode_func

    abstract interface
        pure function ode_func(t, y) result(dy)
            real(8), intent(in) :: t, y
            real(8) :: dy
        end function
    end interface

    contains

    pure subroutine rk4_step(y, t, dt, f)
        real(8), intent(inout) :: y
        real(8), intent(in) :: t, dt
        procedure(ode_func) :: f
        real(8) :: k1, k2, k3, k4

        k1 = f(t,          y            )
        k2 = f(t + dt/3,   y + dt*k1/3  )
        k3 = f(t + 2*dt/3, y + dt*2*k2/3)
        k4 = f(t + dt,     y + dt*k3    )
        y = y + dt * (k1 + 3*k2 + 3*k3 + k4) / 8

    end subroutine rk4_step

end module integrators