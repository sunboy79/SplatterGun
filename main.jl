mutable struct Particle
  pos::Array{Real,1}
  vel::Array{Real,1}
end

#Create a bunch
using Random
rng = MersenneTwister(1234)

nparticles = 128
bunch = Array{Particle,1}(undef, nparticles)
for ii in 1:nparticles
  pos = randn(rng,3)
  vel = randn(rng,3)
  bunch[ii] = Particle(pos, vel)
end

function Push(bunch::Array{Particle,1}, dt::Real, nsteps::Integer)

  #Advance the bunch
  for jj = 1:nsteps
    for part in bunch; 
      part.pos = part.pos + part.vel*dt; 
    end
  end
end

println("time = ", 0.0)
for part in bunch; println(part.pos); end

@time Push(bunch, 1.0e-3, 100)

println("time = ",0.1 )
for part in bunch; println(part.pos); end

