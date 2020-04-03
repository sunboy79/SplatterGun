mutable struct Particle
  pos::Array{Real,1}
  vel::Array{Real,1}
end


#create a bunch
nparticles = 16

bunch = Array{Particle,1}(undef, nparticles)

using Random
rng = MersenneTwister(1234)

for ii in 1:nparticles
  pos = randn(rng,3)
  vel = randn(rng,3)
  bunch[ii] = Particle(pos, vel)
end

for part in bunch; println(part); end
