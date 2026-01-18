module models
    implicit none
    private
    public :: ode_model

    type, abstract :: ode_model
    contains
        procedure(ode_interface), deferred :: f
    end type ode_model

    abstract interface
        pure function ode_interface(this, t, y) result(dy)
            import :: ode_model
            class(ode_model), intent(in) :: this
            real(8), intent(in) :: t, y(:)
            real(8) :: dy(size(y))
        end function ode_interface
    end interface
end module models