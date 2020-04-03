mutable struct Particle
  px::Real; py::Real; pz::Real
  vx::Real; vy::Real; vz::Real
end

Particle(x::Real) = Particle(x,x,x,x,x,x)
Particle(vec::Array) = Particle(vec[1],vec[2],vec[3],vec[4],vec[5],vec[6])
Particle() = Particle(0)

nparticles = 16

bunch = Array{Particle,1}(undef, nparticles)

using Random

rng = MersenneTwister(1234)

for ii in 1:nparticles
  #print(randn(rng,6),"\n")
  bunch[ii] = Particle(randn(rng,6))
  print(bunch[ii],"\n")
end

#print(bunch)
