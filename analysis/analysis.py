from matplotlib import pyplot as plt
import numpy as np
import pandas as pd


def main():
    data = pd.read_csv("./analysis/data.csv")
    t = data.values[:, 0]
    y = data.values[:, 1]
    plt.plot(t, y, label="RK4")
    plt.plot(t, -np.cos(t), ls="dashed", label="Analytic")
    plt.legend(title="Method")
    plt.xlabel("t")
    plt.ylabel("y")
    plt.show()


if __name__ == "__main__":
    main()
