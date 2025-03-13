cmake_minimum_required(VERSION 3.10)
project(simula-trigo)

enable_language(Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

add_library(-simula-trigo-library STATIC
    src/model/Parser.f90
    src/model/Parameters.f90
    src/model/Cultivar.f90
    src/model/Coefficients.f90
    src/model/IO.f90
    src/model/Meteorology.f90
    src/model/Results.f90
    src/model/Simulation.f90
    src/model/Utils.f90
)


add_executable(simula-trigo src/model/Program.f90)
target_link_libraries(simula-trigo -simula-trigo-library)