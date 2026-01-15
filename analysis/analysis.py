from matplotlib import pyplot as plt
import numpy as np
import pandas as pd


def phase_space(data):
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
    plt.savefig("figures/Phase Space Diagram.png")


def plot_solution(data):
    t = data.values[:, 0]
    y_alt = data.values[:, 1]
    y_be = data.values[:, 3]
    t_interp = np.linspace(0, np.max(t), 1000)
    plt.plot(t, y_alt, label="RK4 (1/8, Explicit)")
    plt.plot(t, y_be, label="Backwards Euler")
    plt.plot(t_interp, np.sin(t_interp), ls="dashed", label="Analytic")
    plt.legend(title="Method")
    plt.xlabel("Timme")
    plt.ylabel("Velocity")
    plt.tight_layout()
    plt.savefig("figures/Solution.png")


def main():
    data = pd.read_csv("./analysis/data.csv")
    plot_solution(data)
    phase_space(data)


if __name__ == "__main__":
    main()
