package main

import (
	"slices"
	"testing"
)

func Test_neuron(t *testing.T) {
	// Create a mock neuron
	neuron := &NeuronImpl{
		weights: []float64{0.5, -0.2, 0.1},
		bias:    0.3,
		inputs:  []float64{0.1, 0.1, 4},
	}

	// Test Weights method
	expectedWeights := []float64{0.5, -0.2, 0.1}
	if !slices.Equal(neuron.Weights(), expectedWeights) {
		t.Errorf("Expected weights %v, got %v", expectedWeights, neuron.Weights())
	} else {
		t.Logf("Weights are correct: %v", neuron.Weights())
	}

	// Test Bias method
	expectedBias := 0.3
	if neuron.Bias() != expectedBias {
		t.Errorf("Expected bias %f, got %f", expectedBias, neuron.Bias())
	} else {
		t.Logf("Bias is correct: %f", neuron.Bias())
	}

	// Test Inputs method
	expectedInputs := []float64{0.1, 0.1, 4}
	if !slices.Equal(neuron.Inputs(), expectedInputs) {
		t.Errorf("Expected inputs %v, got %v", expectedInputs, neuron.Inputs())
	} else {
		t.Logf("Inputs are correct: %v", neuron.Inputs())
	}

	// Test Output method
	expectedOutput := 0.5*0.1 + (-0.2)*0.1 + 0.1*4 + 0.3
	if neuron.Output() != expectedOutput {
		t.Errorf("Expected output %f, got %f", expectedOutput, neuron.Output())
	} else {
		t.Logf("Output is correct: %f", neuron.Output())
	}
}
