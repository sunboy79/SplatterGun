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