module Particles

using Random

mutable struct Particle
  pos::Array{Real,1}
  vel::Array{Real,1}
end

function Init(bunch::Array{Particle,1})
  rng = MersenneTwister(1234)
  for ii in 1:nparticles
    pos = randn(rng,3)
    vel = randn(rng,3)
    bunch[ii] = Particle(pos, vel)
  end
end


function Push(bunch::Array{Particle,1}, dt::Real, nsteps::Integer)
  for ii = 1:nsteps
    for part in bunch; 
      part.pos = part.pos + part.vel*dt; 
    end
  end
end

end # module
