from neuron import Neuron

fn main() raises:
    # Test one
    var inputs: List[Float32] = [1.0, 2.0, 3.0]
    var neuron = Neuron([0.2, 0.8, -0.5], 2.0)
    neuron.dump()
    var output = neuron.output(inputs)
    print("Neuron output: ", output)
    # Test two
    var inputs2: List[Float32] = [1.0, 2.0, 3.0, 2.5]
    var neuron2 = Neuron([0.2, 0.8, -0.5, 1.0], 2.0)
    print("Neuron2 output: ", neuron2.output(inputs2)) 
