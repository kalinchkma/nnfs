from neuron import Neuron
from layer import Layer

fn main() raises:
    # Test one
    var inputs: List[Float32] = List[Float32](1.0, 2.0, 3.0)
    var neuron = Neuron(List[Float32](0.2, 0.8, -0.5), 2.0)
    neuron.dump()
    var output = neuron.output(inputs)
    print("Neuron output: ", output)
    # Test two
    var inputs2: List[Float32] = List[Float32](1.0, 2.0, 3.0, 2.5)
    var neuron2 = Neuron(List[Float32](0.2, 0.8, -0.5, 1.0), 2.0)
    print("Neuron2 output: ", neuron2.output(inputs2)) 

    # Multiple neurons test with layer
    var layer = Layer()

    layer.add_neuron(Neuron(List[Float32](0.2, 0.8, -0.5, 1), 2.0))
    layer.add_neuron(Neuron(List[Float32](0.5, -0.91, 0.26, -0.5), 3.0))
    layer.add_neuron(Neuron(List[Float32](-0.26, -0.27, 0.17, 0.87), 0.5))

    layer_output = layer.output(List[Float32](1.0, 2.0, 3.0, 2.5))
    
    print('Layer output: ')
    for o in layer_output:
        print(o[], end=' ')
    print()  # New line after layer output

    