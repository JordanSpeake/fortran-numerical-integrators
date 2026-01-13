module odes
    implicit none
    private

    public :: ode_func

    abstract interface
        pure function ode_func(t, y) result(dy)
            real(8), intent(in) :: t, y
            real(8) :: dy
        end function
    end interface


end module odes