︠2c5c3177-4bfe-40eb-aa93-cbce1895d4b4i︠
typeset_mode(true)
%md

# Week 7 - Adaptive Optics
︡36eb066f-f4bd-41d3-b8e2-0b10d2626863︡{"md":"\n# Week 7 - Adaptive Optics"}︡
︠61da6d4f-1698-4562-98af-45abf9be4605a︠
# astrophysics .sagews prologue
%auto
typeset_mode(true)
import scipy.constants

︡ec31e44e-9f6f-483e-8481-01727b5a91f0︡{"auto":true}︡
︠e9e6f442-5d69-4794-a762-802315d086a7︠
# numeric approximation for pi
Npi = scipy.constants.pi
Npi
︡81c1db71-afff-430d-9c8e-9463563c6441︡{"tex":{"tex":"3.14159265359","display":true}}︡
︠78463d66-915f-4632-99bf-9388449998cc︠
︡59b74aa5-0474-4b9b-a8c0-6432473af2dd︡
︠f73c0b01-c8aa-4cf3-8e25-6b8a19a2b30e︠
# Star is at distance D from Earth and has luminosity L
# flux at earth is
%var F_s,L,D
eq_flux = F_s == L / (4 * pi * D^2)
eq_flux
︡6cfc25db-37d1-4b89-bed4-2e71d7346119︡{"tex":{"tex":"F_{s} = \\frac{L}{4 \\, \\pi D^{2}}","display":true}}︡
︠e35bc929-b566-4f08-a35c-6c8fda813238︠
# Planet has radius r_p and orbit r_o. If 100% of light from the star is reflected, what is flux at Earth?
%var F_p,r_p,r_o,L_p

# first compute lumninosity of the planet, which is the flux from the star hitting the area of the planet
eq_lp = L_p == (L/(4 * pi * r_o^2)) * (pi * r_p^2)
eq_lp

# then compute the flux from the planet at Earth
eq_fp = eq_flux.subs_expr(F_s == F_p,L == L_p)
eq_fp
eq_fp2 = eq_fp.subs(eq_lp)
eq_fp2

# how much brighter is the star than the planet?
eq_sp = eq_flux/eq_fp2
eq_sp

︡a9dcd25d-cabc-4375-aafb-29a13f8958d2︡{"tex":{"tex":"L_{p} = \\frac{L r_{p}^{2}}{4 \\, r_{o}^{2}}","display":true}}︡{"tex":{"tex":"F_{p} = \\frac{L_{p}}{4 \\, \\pi D^{2}}","display":true}}︡{"tex":{"tex":"F_{p} = \\frac{L r_{p}^{2}}{16 \\, \\pi D^{2} r_{o}^{2}}","display":true}}︡{"tex":{"tex":"\\frac{F_{s}}{F_{p}} = \\frac{4 \\, r_{o}^{2}}{r_{p}^{2}}","display":true}}︡
︠ec6da592-f415-4e87-9dd5-6da6f68fab69i︠
%md
## LQ7.5 Diffraction limit
︡fa49ef00-e8fd-49e1-860d-a0523f52fe76︡{"md":"## LQ7.5 Diffraction limit\n"}︡
︠7176b920-9ab8-493f-a1a3-23f83d9ca3f9︠
%var theta,D
lam = var("lam",latex_name="\lambda")
eqdl = theta == lam / D
eqdl
︡2e3ee334-fced-4e36-b9b7-120158a70395︡{"tex":{"tex":"\\theta = \\frac{\\lambda}{D}","display":true}}︡
︠57199dee-e2f6-45c2-abbd-c46a794c6275︠
# theta_SS (resolution in radians) for Siding Spring Observatory
%var theta_SS
lam_SS = (0.5 * units.length.meter * units.si_prefixes.micro).convert()
D_SS = 2.3 * units.length.meter
theta_SS == (eqdl.subs(lam = lam_SS,D = D_SS)).rhs()
︡90b2dbe4-6f70-4bd9-9880-9f4f4c47d5f1︡{"tex":{"tex":"\\theta_{\\mathit{SS}} = \\left(2.17391304347826 \\times 10^{-7}\\right)","display":true}}︡
︠4918e2a7-8715-495d-b131-fc5a2e39b253︠
# theta_PR (resolution in radians) for Parkes Radio Telescope
%var theta_PR
lam_PR = (21.0 * units.length.centimeter).convert()
D_PR = 64.0 * units.length.meter
theta_PR == (eqdl.subs(lam = lam_PR,D = D_PR)).rhs()
︡cb42538c-5e84-45d2-9dd7-5d18027bf57e︡{"tex":{"tex":"\\theta_{\\mathit{PR}} = 0.00328125000000000","display":true}}︡
︠87e0e808-0d90-49c9-b7d7-4fbcd9583d87i︠
%md
## Practice Questions
︡84ce2ff2-5780-40e3-819b-e09d35a4ffc5︡{"md":"## Practice Questions\n"}︡
︠032aef62-cfe9-4d9d-ad31-018bd18cc154︠
# PQ7.1 Angular separation
%var theta_rad,r_orbit,D
eq_as = theta_rad == r_orbit / D
eq_as
︡927cecfd-2ca6-4b06-bc8e-94e40889dba8︡{"tex":{"tex":"\\theta_{\\mathit{rad}} = \\frac{r_{\\mathit{orbit}}}{D}","display":true}}︡
︠9c15e87a-f60c-48c8-816a-ccf813d45fae︠
%var as_rad
# r71 = planet orbit radius form 7.1
r71 = 1.5e11 * units.length.meter
D71 = 4.1e16 * units.length.meter
as_arcsec = (eq_as.subs(r_orbit = r71,D = D71).rhs()) * (units.angles.radian.convert(units.angles.arc_second))
as_arcsec.simplify()*pi/Npi
print("angular separation is {0}".format(as_arcsec.simplify()*pi/Npi))
as_rad = eq_as.subs(r_orbit = r71,D = D71).rhs()
print("angular separation in radians is {0}".format(as_rad))

︡f886b404-f401-417f-b19a-b71afef2f7d0︡{"tex":{"tex":"0.754627339928 \\, \\mathit{arc}_{\\mathit{second}}","display":true}}︡{"stdout":"angular separation is 0.754627339928*arc_second\n"}︡{"stdout":"angular separation in radians is 3.65853658536585e-6\n"}︡
︠ff0caca7-a363-4f97-b6c0-dae51682f3f6︠
# PQ7.2 Brightness ratio
# rp71 = planet radius from 7.1
rp71 = 6400 * units.length.kilometer.convert()
rp71
star_over_planet_flux = eq_sp.subs(r_o = r71,r_p = rp71)
star_over_planet_flux
print(star_over_planet_flux)
︡29c32030-9e26-4c9e-97e6-ad48fe5abb0a︡{"tex":{"tex":"6400000 \\, \\mathit{meter}","display":true}}︡{"tex":{"tex":"\\frac{F_{s}}{F_{p}} = \\left(2.19726562500000 \\times 10^{9}\\right)","display":true}}︡{"stdout":"F_s/F_p == 2.19726562500000e9\n"}︡
︠a27d5e84-5f2d-41f0-a376-f0446718a943︠
# PQ7.3
eqdl
lam73 = 0.5 * units.length.meter * units.si_prefixes.micro.convert()
eq73a = eqdl.subs(theta = as_rad,lam=lam73)
eq73b = (eq73a*D).solve(D)[0]
eq73b
md = float(eq73b.rhs().coeffs()[0][0].n())
print("Mirror diameter is {:.3f} meters".format(md))
︡22e49419-55fc-4556-b9c3-47786731d50e︡{"tex":{"tex":"\\theta = \\frac{\\lambda}{D}","display":true}}︡{"tex":{"tex":"D = \\frac{41}{300} \\, \\mathit{meter}","display":true}}︡{"stdout":"Mirror diameter is 0.137 meters\n"}︡
︠17637368-bbb0-4ece-aea4-82f6e580042ei︠
%md

## End
︡a7cc368d-b50f-4d96-8059-f7973c286210︡{"md":"\n## End\n"}︡
︠34971818-a5b9-44bc-b034-d117cbe31d25︠









