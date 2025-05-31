from gpu.host import DeviceContext
from sys import has_accelerator

def gp():
    @parameter
    if not has_accelerator():
        print("No compatible GPU found")
    else:
        ctx = DeviceContext()
        print("Found GPU:", ctx.name())


trait PairTrait:
    fn update(mut self, first: Int, second: Int):
        ...
    fn dump(self):
        ...
    fn repeat[count: Int](self, msg: String): ...

@value
struct Pair(PairTrait):
    var first: Int
    var second: Int

    # fn __init__(out self, first: Int, second: Int):
    #     self.first = first
    #     self.second = second
    
    fn update(mut self, first: Int, second: Int):
        self.first = first
        self.second = second
    
    fn dump(self):
        print("Pair(first: ", self.first, ", second: ", self.second, ")")
    
    # Parameterized function
    fn repeat[count: Int](self, msg: String):
        @parameter
        for i in range(count):
            print(msg)


fn checkPairTrait[T: PairTrait](mut pair: T):
    pair.dump()
    pair.update(10, 20)
    pair.dump()
    pair.repeat[3]("Hudai")

fn main():
    var pair = Pair(1, 2)
    checkPairTrait(pair)
    var vec = SIMD[DType.float32, 4](1.0, 2.0, 3.0, 4.0)
    var vec2 = SIMD[DType.float32, 4](1.0, 2.0, 3.0, 4.0)
    var product = vec * vec2
    print("Vector: ", vec)
    print("Product: ", product)
    try:
        gp()
    except Exception:
        print("Error in GPU context:", Exception)

