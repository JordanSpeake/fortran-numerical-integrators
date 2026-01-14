from matplotlib import pyplot as plt
import numpy as np
import pandas as pd


def main():
    data = pd.read_csv("./analysis/data.csv")
    t = data.values[:, 0]
    y_standard = data.values[:, 1]
    y_alt = data.values[:, 2]
    t_interp = np.linspace(0, np.max(t), 100)
    plt.plot(t, y_standard, label="RK4 (1/6)")
    plt.plot(t, y_alt, label="RK4 (1/8)")

    plt.plot(t_interp, np.exp(-t_interp), ls="dashed", label="Analytic")
    plt.legend(title="Method")
    plt.xlabel("t")
    plt.ylabel("y")
    plt.show()


if __name__ == "__main__":
    main()
