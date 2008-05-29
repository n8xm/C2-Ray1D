module cgsphotoconstants

  ! A collection of physical constants and conversion factors for 
  ! photo-ionization calculations
  ! Units: cgs
  
  use precision, only: dp
  use cgsconstants

  ! Helium ionization potentials (eV)
  real(kind=dp), dimension(0:1),parameter :: ethe=(/24.587,54.416/)
  ! Hydrogen cross section
  real(kind=dp), parameter :: sigh=6.30e-18
  ! Helium cross section
  real(kind=dp), parameter :: sighe0=7.83e-18
  ! He+ cross section
  real(kind=dp), parameter :: sighe1=1.58e-18
  ! H ionization energy in frequency
  real(kind=dp), parameter :: frth0=ev2fr*eth0
  ! He ionization energy in frequency
  real(kind=dp), parameter :: frthe0=ev2fr*ethe(0)
  ! He+ ionization energy in frequency
  real(kind=dp), parameter :: frthe1=ev2fr*ethe(1)
  ! Frequency dependence of H cross section parameter
  real(kind=dp),parameter :: betah0=1.0
  ! Frequency dependence of H cross section parameter
  real(kind=dp), parameter :: sh0=2.8
  ! Frequency dependence of He cross section parameter
  real(kind=dp), parameter :: she0=1.7
  ! Frequency dependence of He+ cross section parameter
  real(kind=dp), parameter :: she1=2.8
  ! 
  !-----------------------------------------------------------------------
  !     find upper limits for integrals
  !     frtop1: this is the upper limit due to arithmetic precision:
  !     exp(700) exceeds double precision limit
  !     frtop2: this is the upper limit due to the form of the planck
  !     curve: take 10 times the frequency of maximum intensity
  !-----------------------------------------------------------------------
  real(kind=dp), parameter :: thigh=200000.0
  real(kind=dp), parameter :: tlow=2000.0
  !real(kind=dp), parameter :: frtop1=700.0*tlow/47979.72484*1e15
  real(kind=dp), parameter :: frtop1=700.0*tlow*kb/hplanck
  real(kind=dp), parameter :: frtop2=5.88e-05*thigh*1e15
  
  real(kind=dp) :: tf2h,tf3h,tf3he0
  ! 
contains

  subroutine ini_factors
    ! This subroutine initializes the factors needed
    ! to combine the three optical depths (H, He0, He+) 
    ! in the spectral regions where they all occur.
    ! This is from Tenorio-Tagle et al. (1983)
    ! 
    tf2h=(0.63*frth0/frthe0)**(she0)
    tf3h=(frth0/frthe1)**(she1)
    tf3he0=(1.51*frthe0/frthe1)**(she1)
  end subroutine ini_factors

end module cgsphotoconstants



