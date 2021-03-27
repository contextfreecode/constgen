from math import sqrt
from typing import Tuple, TypeVar, cast


Val = TypeVar("Val")


def vec_ops(size: int):
    # Vec = Tuple.__getitem__((Val,) * size)
    Vec = Tuple[Val, Val]

    class VecOps:
        @staticmethod
        def dot(a: Vec, b: Vec) -> Val:
            val = cast(Val, 0)
            for i in range(size):
                val += a[i] * b[i]
            return val

        @staticmethod
        def norm(a: Vec) -> Val:
            return cast(Val, sqrt(VecOps.dot(a, a)))

    return VecOps


vec_ops_2 = vec_ops(2)


def main():
    a = (1.5, 2)
    print(f"norm: {vec_ops_2.norm(a)}")


if __name__ == "__main__":
    main()
