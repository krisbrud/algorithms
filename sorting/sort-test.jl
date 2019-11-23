using Test

function sort_test(sort_alg)
    # Tests the sorting-algorithm sort_alg through some test cases.

    println("Running tests!")

    @testset "Sorting tests" begin
        @test sort_alg([]) == []

        @test sort_alg([1]) == [1]

        @test sort_alg([2, 1]) == [1, 2]
        
        @test sort_alg([1, 2, 3]) == [1, 2, 3]

        @test sort_alg([3, 2, 1]) == [1, 2, 3]

        @test sort_alg([1, 3, 4, 2]) == [1, 2, 3, 4]

        @test sort_alg([-4, -5, 31, 27, 13, -11, 24, -29, -42, 28]) == [-42, -29, -11, -5, -4, 13, 24, 27, 28, 31]
    end
end