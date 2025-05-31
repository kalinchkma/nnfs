package nnfs

import "testing"

func Test_layer(t *testing.T) {
	// Create a mock layer
	layer := &LayerImpl{}

	// Create mock neurons
	neuron1 := &NeuronImpl{
		inputs:  []float64{1, 2, 3},
		weights: []float64{0.2, 0.8, -0.5},
		bias:    2,
	}
	neuron2 := &NeuronImpl{
		inputs:  []float64{4, 5, 6},
		weights: []float64{0.1, -0.3, 0.4},
		bias:    1,
	}

	// Add neurons to the layer
	layer.AddNeuron(neuron1)
	layer.AddNeuron(neuron2)

	// Test Neurons method
	if len(layer.Neurons()) != 2 {
		t.Errorf("Expected 2 neurons, got %d", len(layer.Neurons()))
	} else {
		t.Logf("Neurons count is correct: %d", len(layer.Neurons()))
	}

	// Test Outputs method
	expectedOutputs := []float64{neuron1.Output(), neuron2.Output()}
	if outputs := layer.Outputs(); len(outputs) != len(expectedOutputs) || outputs[0] != expectedOutputs[0] || outputs[1] != expectedOutputs[1] {
		t.Errorf("Expected outputs %v, got %v", expectedOutputs, outputs)
	} else {
		t.Logf("Outputs are correct: %v", outputs)
	}

}
