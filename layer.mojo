from neuron import Neuron

@value
struct Layer:
    var neurons: List[Neuron]

    fn __init__(out self):
        self.neurons = List[Neuron]()
    
    fn add_neuron(mut self, neuron: Neuron):
        self.neurons.append(neuron)

    fn output(self, inputs: List[Float32]) raises -> List[Float32]:
        var outputs: List[Float32] = List[Float32]()
        for neuron in self.neurons:
            outputs.append(neuron[].output(inputs))
        return outputs
    