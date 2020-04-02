struct Particle
  px::Real; py::Real; pz::Real
  vx::Real; vy::Real; vz::Real
end

Particle() = Particle(0,0,0,0,0,0)

part = Particle()
print(part.px)
