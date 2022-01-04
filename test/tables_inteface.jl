using Test
using XLSXasJSON
using Tables
using JSONPointer

data_path = joinpath(@__DIR__, "data")

@testset "Tables.jl integration" begin 
    f = joinpath(data_path, "example.xlsx")
    jws = JSONWorksheet(f, "Sheet1")

    @test Tables.istable(jws)
    @test Tables.isrowtable(jws)
    @test Tables.rowaccess(jws)
    @test Tables.columnaccess(jws) == false 
    Tables.columnnames(jws) == jws.pointer

    @test Tables.rows(jws) == jws.data
    @test Tables.columns(jws) == map(i -> jws[:, i], 1:size(jws, 2))
    @test Tables.getcolumn(jws, 1) == jws[:, 1]
    @test Tables.getcolumn(jws, 2) == jws[:, 2]

    @test Tables.getcolumn(jws, j"/array_int") == Tables.getcolumn(jws, 3)
    @test Tables.getcolumn(jws, Symbol("/array_float")) == Tables.getcolumn(jws, 4)

    @test Tables.matrix(jws) == jws[:, :]
    mat_trans = Tables.matrix(jws, true)
    for i in 1:length(jws)
        @test mat_trans[1, i] == jws[i, 1]
        @test mat_trans[2, i] == jws[i, 2]
        @test mat_trans[3, i] == jws[i, 3]
        @test mat_trans[4, i] == jws[i, 4]
    end
end