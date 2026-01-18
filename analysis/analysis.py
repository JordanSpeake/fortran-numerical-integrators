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
    x = data.values[:, 1]
    v = data.values[:, 2]
    plt.plot(t, x)
    plt.xlabel("Time")
    plt.ylabel("Velocity")
    # plt.show()
    plt.savefig("figures/Solution.png")


def main():
    data = pd.read_csv("./analysis/data.csv")
    plot_solution(data)
    # phase_space(data)


if __name__ == "__main__":
    main()
