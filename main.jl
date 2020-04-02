mutable struct Particle
  px::Real; py::Real; pz::Real
  vx::Real; vy::Real; vz::Real
end

Particle() = Particle(0,0,0,0,0,0)

mutable struct Bunch
  particles::Vector{Particle}
end

Bunch() = Bunch(Particle[])

part = Particle()

bunch = Bunch()
print(bunch)

push!(bunch.particles, part)
push!(bunch.particles, part)
push!(bunch.particles, part)
print(bunch)