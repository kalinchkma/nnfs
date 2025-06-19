import subprocess
import platform
import torch

def check_mps_gpu():
    """Check if a Metal-capable GPU (MPS) is available using PyTorch."""
    if torch.backends.mps.is_available():
        print("MPS (Metal Performance Shaders) GPU is available!")
        print(f"PyTorch version: {torch.__version__}")
        device = torch.device("mps")
        print(f"Using device: {device}")
        return True
    else:
        print("No MPS GPU detected.")
        return False

def check_system_gpu():
    """Check GPU hardware details using macOS system_profiler."""
    try:
        # Run system_profiler to get graphics/display info
        result = subprocess.run(
            ["system_profiler", "SPDisplaysDataType"],
            capture_output=True,
            text=True,
            check=True
        )
        output = result.stdout
        print("\nGPU Hardware Information:")
        print("-" * 50)
        print(output)
        return True
    except subprocess.CalledProcessError as e:
        print("Error querying GPU hardware:", e)
        return False

def main():
    print(f"System: {platform.system()} {platform.release()} ({platform.machine()})")
    
    # Check for MPS GPU (Apple Silicon)
    print("\nChecking for MPS GPU (PyTorch)...")
    mps_available = check_mps_gpu()
    
    # Check GPU hardware details
    print("\nChecking GPU hardware (system_profiler)...")
    check_system_gpu()
    
    # Summary
    print("\nSummary:")
    if mps_available:
        print("GPU is available for computation (MPS supported).")
    else:
        print("No GPU available for computation or MPS not supported.")

if __name__ == "__main__":
    main()