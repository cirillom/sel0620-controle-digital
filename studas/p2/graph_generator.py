import matplotlib.pyplot as plt

def plot_custom_waveform(signal, title="Custom Waveform Visualization"):
    time = []
    waveform = []
    t = 0  # Initial time
    
    # Generate waveform points
    for voltage in signal:
        waveform.extend([voltage, voltage])  # Extend for constant value over a bit period
        time.extend([t, t + 1])  # Add time points
        t += 1
    
    # Plot the waveform
    plt.figure(figsize=(12, 4))
    plt.step(time, waveform, where='post', label="Custom Waveform", color="blue")
    plt.axhline(0, color='black', linewidth=0.5, linestyle='--')  # Reference line
    
    # Add vertical lines to separate bits
    for t in range(len(signal) + 1):
        plt.vlines(t, 0, 1.25, colors='gray', linestyles='dotted', linewidth=0.8)
    
    # Customize the plot
    plt.title(title)
    plt.xlabel("k")
    plt.ylabel("Amplitude")
    plt.ylim(0, 1.25)
    plt.xlim(0, len(signal))
    plt.grid(True)  # Remove grid if desired

    # Remove axis markings
    plt.xticks([x for x in range(len(signal))])  # Remove x-axis markings
    signal_markings = [0, 0.25, 0.5, 0.75, 1, 1.25]
    plt.yticks(signal_markings)  # Remove y-axis markings

    # Show the plot
    plt.show()

signal = [0, 0.485, 0.92125, 1, 1, 1, 1, 1]
plot_custom_waveform(signal, "Saída da planta y(k)")