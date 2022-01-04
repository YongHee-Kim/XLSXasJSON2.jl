using XLSXasJSON
using JSONPointer
using PrettyTables

data_path = joinpath(@__DIR__, "data")

f = joinpath(data_path, "example.xlsx")
jwb = JSONWorkbook(f)

pretty_table(jwb[1].data)   