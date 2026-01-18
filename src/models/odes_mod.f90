module odes_mod
    use models, only : ode_model
    implicit none

    type, extends(ode_model) :: damped_harmonic_oscillator
        real :: zeta = 1 ! Damping ratio
        real :: omega_0 = 1 ! Undamped natural frequency
        contains
        procedure :: f => dho_func
    end type damped_harmonic_oscillator

    contains
    pure function dho_func(this, t, y) result(dy)
        class(damped_harmonic_oscillator), intent(in) :: this
        real(8), intent(in) :: t, y(:)
        real(8) :: dy(size(y))
        associate(u => t); end associate

        dy(1) = y(2)
        dy(2) = -(2*this%zeta*this%omega_0*y(2) + this%omega_0 * y(1))

    end function dho_func
end module odes_mod