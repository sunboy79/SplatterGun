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

struct Mesh
  xaxis::Array{Real}
  yaxis::Array{Real}
  zaxis::Array{Real}
end

function Axis(x1::Real, x2::Real, nx::Integer)
  dx = (x2-x1)/nx
  xx = zeros(nx+1)
  for ii=1:nx+1; xx[ii] = x1+dx*(ii-1); end
  return xx
end

function PrintAxis(io::IOStream, axis::Array{Real})
  str = summary(axis)*": "
  for val in axis; str *= string(val, " "); end
  str *= "\n"
  write(io, str)
end

function PrintMesh(io::IOStream, mesh::Mesh)
  PrintAxis(io, mesh.xaxis)
  PrintAxis(io, mesh.yaxis)
  PrintAxis(io, mesh.zaxis)
end

nx = 40; ny = 20; nz = 12

xaxis = Axis(-10.0,10.0,nx)
yaxis = Axis( -5.0, 5.0,ny)
zaxis = Axis( -1.0, 5.0,nz)

mesh = Mesh(xaxis, yaxis, zaxis)

io = open("mesh.txt", "w")
PrintMesh(io, mesh)
close(io)

doParticles = false

if doParticles
  nparticles = 1024
  bunch = Array{Particle,1}(undef, nparticles)

  @time Init(bunch)

  @time Push(bunch, 1.0e-3, 10)
  @time Push(bunch, 1.0e-3, 10)
  @time Push(bunch, 1.0e-3, 10)
  @time Push(bunch, 1.0e-3, 10)
  @time Push(bunch, 1.0e-3, 10)
end