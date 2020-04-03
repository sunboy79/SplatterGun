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

nparticles = 128
bunch = Array{Particle,1}(undef, nparticles)

@time Init(bunch)

#println("time = ", 0.0)
#for part in bunch; println(part.pos); end

@time Push(bunch, 1.0e-3, 100)

#println("time = ",0.1 )
#for part in bunch; println(part.pos); end

