package nnfs

import "testing"

func Test_layer(t *testing.T) {
	// Create a mock layer
	layer := &LayerImpl{}

	inputs := []float64{1.0, 2.0, 3.0, 2.5}

	// Create mock neurons
	neuron1 := &NeuronImpl{
		inputs:  inputs,
		weights: []float64{0.2, 0.8, -0.5, 1.0},
		bias:    2,
	}
	neuron2 := &NeuronImpl{
		inputs:  inputs,
		weights: []float64{0.5, -0.91, 0.26, -0.5},
		bias:    3,
	}
	neuron3 := &NeuronImpl{
		inputs:  inputs,
		weights: []float64{-0.26, -0.27, 0.17, 0.87},
		bias:    0.5,
	}

	// Add neurons to the layer
	layer.AddNeuron(neuron1)
	layer.AddNeuron(neuron2)
	layer.AddNeuron(neuron3)

	// Test Neurons method
	if len(layer.Neurons()) != 3 {
		t.Errorf("Expected 2 neurons, got %d", len(layer.Neurons()))
	} else {
		t.Logf("Neurons count is correct: %d", len(layer.Neurons()))
	}

	// Test Outputs method
	expectedOutputs := []float64{4.8, 1.21, 2.285}
	if outputs := layer.Outputs(); len(outputs) != len(expectedOutputs) || outputs[0] != expectedOutputs[0] || outputs[1] != expectedOutputs[1] {
		t.Errorf("Expected outputs %v, got %v", expectedOutputs, outputs)
	} else {
		t.Logf("Outputs are correct: %v", outputs)
	}

}
