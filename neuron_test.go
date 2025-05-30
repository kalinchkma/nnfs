package main

import (
	"slices"
	"testing"
)

func Test_neuron(t *testing.T) {
	// Create a mock neuron
	neuron := &NeuronImpl{
		inputs:  []float64{1, 2, 3},
		weights: []float64{0.2, 0.8, -0.5},
		bias:    2,
	}

	// Test Weights method
	expectedWeights := []float64{0.2, 0.8, -0.5}
	if !slices.Equal(neuron.Weights(), expectedWeights) {
		t.Errorf("Expected weights %v, got %v", expectedWeights, neuron.Weights())
	} else {
		t.Logf("Weights are correct: %v", neuron.Weights())
	}

	// Test Bias method
	expectedBias := 2.0
	if neuron.Bias() != expectedBias {
		t.Errorf("Expected bias %f, got %f", expectedBias, neuron.Bias())
	} else {
		t.Logf("Bias is correct: %f", neuron.Bias())
	}

	// Test Inputs method
	expectedInputs := []float64{1, 1, 3}
	if !slices.Equal(neuron.Inputs(), expectedInputs) {
		t.Errorf("Expected inputs %v, got %v", expectedInputs, neuron.Inputs())
	} else {
		t.Logf("Inputs are correct: %v", neuron.Inputs())
	}

	// Test Output method
	expectedOutput := 1*0.2 + 2*0.8 + 3*(-0.5) + 2.0
	if neuron.Output() != expectedOutput {
		t.Errorf("Expected output %f, got %f", expectedOutput, neuron.Output())
	} else {
		t.Logf("Output is correct: %f", neuron.Output())
	}

	// Calculation test
	expectedOutput = 4.8
	testNeuron := NeuronImpl{
		inputs:  []float64{1.0, 2.0, 3.0, 2.5},
		weights: []float64{0.2, 0.8, -0.5, 1.0},
		bias:    2.0,
	}
	if testNeuron.Output() != expectedOutput {
		t.Errorf("Expected output %f, got %f", expectedOutput, testNeuron.Output())
	} else {
		t.Logf("Calculated test pass: %f", testNeuron.Output())
	}
}
