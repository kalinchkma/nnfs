package nnfs

type Layer interface {
	// AddNeuron adds a neuron to the layer.
	AddNeuron(neuron Neuron)
	// Neurons returns the list of neurons in the layer.
	Neurons() []Neuron
	// Outputs returns the outputs of all neurons in the layer.
	Outputs() []float64
	// Forward passes the inputs through the layer and returns the outputs.
	Forward(inputs []float64) []float64
	// Backward computes the gradients for the layer based on the outputs and targets.
	Backward(outputs []float64, targets []float64) []float64
	// UpdateWeights updates the weights of the neurons in the layer based on the gradients.
	UpdateWeights(learningRate float64)
	// Reset resets the layer's state, clearing inputs and outputs.
	Reset()
}

type LayerImpl struct {
	neurons []Neuron
}

func (l *LayerImpl) AddNeuron(neuron Neuron) {
	l.neurons = append(l.neurons, neuron)
}

func (l *LayerImpl) Neurons() []Neuron {
	return l.neurons
}

func (l *LayerImpl) Outputs() []float64 {
	outputs := make([]float64, len(l.neurons))
	for i, neuron := range l.neurons {
		outputs[i] = neuron.Output()
	}
	return outputs
}

func (l *LayerImpl) Forward(inputs []float64) []float64 {
	for _, neuron := range l.neurons {
		neuron.(*NeuronImpl).inputs = inputs // Update inputs for each neuron
	}
	return l.Outputs()
}

func (l *LayerImpl) Backward(outputs []float64, targets []float64) []float64 {
	gradients := make([]float64, len(l.neurons))
	for i := range l.neurons {
		// Simple gradient calculation (for demonstration purposes)
		gradients[i] = outputs[i] - targets[i]
	}
	return gradients
}

func (l *LayerImpl) UpdateWeights(learningRate float64) {
	for _, neuron := range l.neurons {
		n := neuron.(*NeuronImpl)
		for i := range n.weights {
			// Update each weight based on the gradient and learning rate
			n.weights[i] -= learningRate * n.inputs[i] // Simplified weight update
		}
		n.bias -= learningRate * n.Output() // Update bias
	}
}

func (l *LayerImpl) Reset() {
	for _, neuron := range l.neurons {
		n := neuron.(*NeuronImpl)
		n.inputs = nil // Clear inputs
	}
	l.neurons = nil // Clear the layer's neurons
}
