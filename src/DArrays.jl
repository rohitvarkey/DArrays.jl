module DArrays #operations on DArrays

function .+{T}(A::DArray{T},B::Number)
        map(r->r+B,A)
    end
end
