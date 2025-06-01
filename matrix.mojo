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
        for i in range(self.length):
            if self.data.load(i) != other.data.load(i):
                return False
        return True

