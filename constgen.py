from collections.abc import Sequence
from numpy import array, complex64, complex128, float32, float64, sqrt
from typing import Any, Callable, Tuple, TypeVar, cast


Val = TypeVar("Val")
# Vec = Tuple.__getitem__((Val,) * size)
# print(Vec)
# Vec = Tuple[Val, Val]
# print(Vec)
Vec = Sequence[Val]


def vec_ops(size: int, val_type: Callable[[Any], Val]):

    class VecOps:
        @staticmethod
        def dot(a: Vec, b: Vec) -> Val:
            val = val_type(0)
            for i in range(size):
                val += a[i] * b[i]
            return val

        @staticmethod
        def norm(a: Vec) -> Val:
            return sqrt(cast(Any, VecOps.dot(a, a)))

    return VecOps


vec_ops_2f32 = vec_ops(2, float32)


def main():
    a = array([1.5, 2], dtype=float32)
    print(f"norm: {vec_ops_2f32.norm(a)}")


if __name__ == "__main__":
    main()
