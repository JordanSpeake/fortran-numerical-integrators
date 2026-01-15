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

    pure function exponential_decay(t, y) result(dy)
        real(8), intent(in) :: t
        real(8), intent(in) :: y(:)
        real(8) :: dy(size(y))
        associate(u => t); end associate
        dy(1) = -y(1)
    end function

    pure function harmonic_oscillator(t, y) result(dy)
        real(8), intent(in) :: t
        real(8), intent(in) :: y(:)
        real(8) :: dy(size(y))
        associate(u => t); end associate
        dy(1) = y(2)
        dy(2) = -y(1)

end function

end module odes