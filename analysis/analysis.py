from matplotlib import pyplot as plt
import numpy as np
import pandas as pd


def phase_space(data, figures_directory):
    fig, ax = plt.subplots(1, 2)
    ax[0].plot(data.values[:, 1], data.values[:, 2])
    ax[0].set_xlabel("Velocity")
    ax[0].set_ylabel("Acceleration")
    ax[0].set_title("RK4 (1/8, Explicit)")
    ax[1].plot(data.values[:, 3], data.values[:, 4])
    ax[1].set_xlabel("Velocity")
    ax[1].set_title("Backwards Euler")
    plt.suptitle("Phase Space Diagrams of ODE Solution")
    plt.tight_layout()
    plt.savefig(f"{figures_directory}phase_space_diagram.png")


def plot_solution(data, figures_directory):
    t = data.values[:, 0]
    x = data.values[:, 1]
    v = data.values[:, 2]
    plt.scatter(t, x, s=0.4)
    plt.scatter(t, v, alpha=0.6, s=0.4)
    plt.xlabel("Time")
    plt.ylabel("Value")
    # plt.legend()
    plt.tight_layout()
    plt.savefig(f"{figures_directory}solution.png", dpi=600)


def main():
    figures_directory = "figures/"
    data_path = "analysis/data.csv"
    print("Plotting figures... ", end="", flush=True)
    data = pd.read_csv(data_path)
    plot_solution(data, figures_directory)
    print("Done.")


if __name__ == "__main__":
    main()
