module DArrays

import Base

for f in (:.+, :.-, :.*, :./, :.%, :.<<, :.>>, :div, :mod, :rem, :&, :|, :$)
    @eval begin
        function ($f){T}(A::DArray{T}, B::Number)
            map(r->($f)(r, B), A)
        end
    end
end

end
