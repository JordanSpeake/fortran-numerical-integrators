module van_der_pol_oscillator_mod
    use models_mod, only: ode_model
    implicit none

    type, extends(ode_model) :: van_der_pol_oscillator
        real :: mu ! Nonlinearity and damping parameter
        contains
        procedure :: f => vdpo_func
    end type van_der_pol_oscillator

    contains
    pure function vdpo_func(this, t, y) result(dy)
        class(van_der_pol_oscillator), intent(in) :: this
        real(8), intent(in) :: t, y(:)
        real(8) :: dy(size(y))
        associate(u => t); end associate
        dy(1) = y(2)
        dy(2) = this%mu * (1- y(1)**2)*y(2) - y(1)
    end function vdpo_func

end module van_der_pol_oscillator_mod