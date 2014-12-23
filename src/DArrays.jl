module DArrays

import Base.Callable

mappart(f::Callable, d::DArray) = DArray(I->f(localpart(d)), d)

for f in (:.+, :.-, :.*, :./, :.%, :.<<, :.>>, :div, :mod, :rem, :&, :|, :$)
    @eval begin
        ($f){T}(A::DArray{T}, B::Number) = mappart(r->($f)(r, B), A)
    end
end

function + {S,T}(A::DArray{S},B::DArray{T})
    assert(A.dims == B.dims)
    if A.pmap == B.pmap && A.indexes == B.indexes
        return mappart(r->r+localpart(B),A)
    else
        reshape(distribute(map(r->r[1]+r[2],zip(A,B))),A.dims)
    end
end

end
