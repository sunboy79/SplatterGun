import Particles

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