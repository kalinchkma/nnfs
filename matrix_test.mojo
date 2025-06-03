from matrix import Matrix

fn main():
    var testMatrix = Matrix(Float32(3), 2, 2)
    testMatrix.print_all()

    var testMatrix2 = Matrix(Float32(9), 2, 2)
    testMatrix2.print_all()

    var mul = testMatrix * testMatrix2
    mul.print_all()

   