package main

type Neuron interface {
	Inputs() []float64
	Weights() []float64
	Bias() float64
	ActivationFunction(input float64) float64
	Output() float64
}

type NeuronImpl struct {
	weights []float64
	bias    float64
	inputs  []float64
}

func (n *NeuronImpl) Weights() []float64 {
	return n.weights
}

func (n *NeuronImpl) Bias() float64 {
	return n.bias
}

func (n *NeuronImpl) Inputs() []float64 {
	return n.inputs
}

func (n *NeuronImpl) Output() float64 {
	var sum float64
	for i, input := range n.inputs {
		sum += input * n.weights[i]
	}
	return sum + n.bias
}
