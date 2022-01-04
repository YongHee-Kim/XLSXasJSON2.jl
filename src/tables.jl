# Tables.jl interface
Tables.istable(::Type{<:JSONWorksheet}) = true
Tables.isrowtable(::Type{<:JSONWorksheet}) = true
Tables.rowaccess(::Type{<:JSONWorksheet}) = true
Tables.rows(jws::JSONWorksheet) = jws.data

Tables.columns(jws::JSONWorksheet) = map(p -> jws[:, p], Tables.columnnames(jws))
Tables.columnnames(jws::JSONWorksheet) = jws.pointer
Tables.getcolumn(jws::JSONWorksheet, i::Int) = jws[:, i]
function Tables.getcolumn(jws::JSONWorksheet, p::Symbol) 
    Tables.getcolumn(jws, JSONPointer.Pointer(string(p)))
end
Tables.getcolumn(jws::JSONWorksheet, p::Pointer) = jws[:, p]


Tables.materializer(jws::JSONWorksheet) = jws.data

function Tables.matrix(jws::JSONWorksheet, transpose::Bool=false)
    matrix = jws[:, :]
    if transpose
        return permutedims(matrix)
    elseif matrix isa AbstractVector
        # always return a matrix, for type stability
        return reshape(matrix, :, 1)
    else
        return matrix
    end
end