module DArrays

import Base

for f in (:.+, :.-, :.*, :./, :.%, :.<<, :.>>, :div, :mod, :rem, :&, :|, :$)
    @eval begin
        function ($f){t}(a::darray{t}, b::number)
            map(r->$(f)(r, b), a)
        end
    end
end

end
