module lotka_volterra_mod
    use models_mod, only: ode_model
    implicit none

    type, extends(ode_model) :: lotka_volterra
        real :: alpha
        real :: beta
        real :: gamma
        real :: delta
        contains
        procedure :: f => lv_func
    end type lotka_volterra

    contains
    pure function lv_func(this, t, y) result(dy)
        class(lotka_volterra), intent(in) :: this
        real(8), intent(in) :: t, y(:)
        real(8) :: dy(size(y))
        associate(u => t); end associate
        dy(1) =  this%alpha * y(1) - this%beta  * y(1) * y(2)
        dy(2) = -this%gamma * y(2) + this%delta * y(1) * y(2)
    end function lv_func

end module lotka_volterra_mod