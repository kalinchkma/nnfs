
struct Neuron:
    var weights: List[Float32]
    var bias: Float32

    fn __init__(out self, weights: List[Float32], bias: Float32):
        self.weights = weights
        self.bias = bias

    fn output(self, inputs: List[Float32]) raises -> Float32:
        if len(inputs) != len(self.weights):
            raise Error("Input size does not match weights size")
        total = self.bias
        for i in range(len(inputs)):
            total += inputs[i] * self.weights[i]
        return total

    fn dump(self):
        print("Bias",self.bias)
        print("Weights: ", end='')
        for w in self.weights:
            print(w[], end=' ') # [] is dereferencing operator
        print()
