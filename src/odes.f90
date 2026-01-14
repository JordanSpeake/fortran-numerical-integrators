module odes
    implicit none
    private

    public :: ode_func, sin_diffeq

    abstract interface
        pure function ode_func(t, y) result(dy)
            real(8), intent(in) :: t, y
            real(8) :: dy
        end function
    end interface

    contains

    pure function sin_diffeq(t, y) result(out)
        real(8), intent(in) :: t, y
        real(8) :: out
        out = sin(t) + (0 * y)
    end function



end module odes