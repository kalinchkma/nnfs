from memory import UnsafePointer

struct Matrix:
    var height: Int
    var width: Int
    var length: Int
    var data: UnsafePointer[Float32]

    fn __init__(out self, defaultValue: Float32 = 0.0, height: Int = 1, width: Int = 1):
        self.height = height
        self.width = width
        self.length = height * width
        self.data = UnsafePointer[Float32].alloc(self.length)
        for i in range(self.length):
            self.data.store(i, defaultValue)
    
    fn __getitem__(read self, row: Int, col: Int) -> Float32:
        var loc: Int = (row * self.width) + col
        if loc > self.length:
            print("Index out of bounds")
            return self.data.load(0)
        return self.data.load(loc)

    fn __setitem__(mut self, row: Int, col: Int, value: Float32):
        var loc: Int = (row * self.width) + col
        if loc > self.length:
            print("Index out of bounds")
            return
        self.data.store(loc, value)
    
    fn __del__(owned self) -> None:
        self.data.free()
    
    fn __len__(read self) -> Int:
        return self.length

    fn __copyinit__(out self, other: Self):
        self.height = other.height
        self.width = other.width
        self.length = other.length
        self.data = UnsafePointer[Float32].alloc(self.length)
        for i in range(self.length):
            self.data.store(i, other.data.load(i))

    fn __eq__(read self, other: Self) -> Bool:
        if self.height != other.height or self.width != other.width:
            return False
        for i in range(self.height):
            for j in range(self.width):
                var selfValue: Float32 = self[i, j]
                var otherValue: Float32 = other[i, j]
                if selfValue < otherValue or selfValue > otherValue:
                    return False
        return True
    
    fn __ne__(read self, other: Self) -> Bool:
        return not self == other

    fn __add__(read self, other: Self) -> Self:
        # Mat1 + Mat2
        if self.width != other.width or self.height != other.height:
            print("Error: Matrix dimensions do not match for addition")
            return Matrix(Float32(0.0), self.height, self.width)
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] + other[i, j]
        return newMatrix
    
    fn __sub__(read self, other: Self) -> Self:
        # Mat1 - Mat2
        if self.width != other.width or self.height != other.height:
            print("Error: Matrix dimensions do not match for addition")
            return Matrix(Float32(0.0), self.height, self.width)
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] - other[i, j]
        return newMatrix
    
    fn __mul__(read self, other: Self) -> Self:
        if self.width != other.height:
            print("Error: Matrix dimensions do not match for multiplication")
            return Matrix(Float32(0.0), self.height, other.width)
        var newMatrix = Matrix(Float32(0.0), self.height, other.width)
        for i in range(self.height):
            for j in range(other.width):
                for k in range(self.width):
                    newMatrix[i, j] += self[i, k] * other[k, j]
        return newMatrix
    
    fn __truediv__(read self, other: Self) -> Self:
        if self.width != other.width or self.height != other.height:
            print("Error: Matrix dimensions do not match for addition")
            return Matrix(Float32(0.0), self.height, self.width)
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] / other[i, j]
        return newMatrix
    
    fn __add__(read self, scalar: Float32) -> Self:
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] + scalar
        return newMatrix
    
    fn __sub__(read self, scalar: Float32) -> Self:
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] - scalar
        return newMatrix
    
    fn __mul__(read self, scalar: Float32) -> Self:
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] * scalar
        return newMatrix
    
    fn __truediv__(read self, scalar: Float32) -> Self:
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = self[i, j] / scalar
        return newMatrix
    
    fn apply_function[func: fn(Float32) -> Float32](read self) -> Self:
        var newMatrix = Matrix(Float32(0.0), self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                newMatrix[i, j] = func(self[i, j])
        return newMatrix
    
    fn print_all(read self) -> None:
        print("[")
        for i in range(self.height):
            print("\t[", end="")
            for j in range(self.width):
                print(self[i, j], end="")
                if j != self.width - 1:
                    print(", ", end="")
            print("]," if i != self.height - 1 else "]")
        print("]")
        
