module odes
    implicit none

    abstract interface
        pure function ode_func(t, y) result(dy)
            real(8), intent(in) :: t
            real(8), intent(in) :: y(:)
            real(8) :: dy(size(y))
        end function
    end interface

    contains

    pure function sin_diffeq(t, y) result(out)
        real(8), intent(in) :: t, y
        real(8) :: out
        out = sin(t) + (0 * y)
    end function

    pure function exponential_decay(t, y) result(out)
        real(8), intent(in) :: t, y
        real(8) :: out
        out = -y + (t * 0)
    end function

    pure function decaying_harmonic_oscillator(t, y) result(out)
        real(8), intent(in) :: t, y
        real(8) :: out


end function

end module odes