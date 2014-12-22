module DArrays

import Base.Callable

mappart(f::Callable, d::DArray) = DArray(I->f(localpart(d)), d)

for f in (:.+, :.-, :.*, :./, :.%, :.<<, :.>>, :div, :mod, :rem, :&, :|, :$)
    @eval begin
        ($f){T}(A::DArray{T}, B::Number) = mappart(r->($f)(r, B), A)
    end
end

end
