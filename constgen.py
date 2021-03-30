from collections.abc import Sequence
from numpy import array, complex64, complex128, float32, float64, sqrt
from typing import Any, Callable, Tuple, TypeVar, cast


Val = TypeVar("Val")
# Vec = Tuple[Val, Val]
# print(Vec)
Vec = Sequence[Val]


def vec_ops(*, size: int, val_type: Callable[[Any], Val]):

    # Vec = Tuple.__getitem__((Val,) * size)
    # print(Vec)
    # Vec = Tuple.__getitem__((val_type,) * size)
    # print(Vec)

    class VecOps:
        @staticmethod
        def dot(a: Vec, b: Vec) -> Val:
            return sum((a[i] * b[i] for i in range(size)), val_type(0))

        @staticmethod
        def norm(a: Vec) -> Val:
            # del VecOps.dot
            return sqrt(cast(Any, VecOps.dot(a, a)))

    return VecOps


vec_ops_2f32 = vec_ops(size=2, val_type=float32)


def main():
    a = array([1.5, 2], dtype=float32)
    print(f"norm: {vec_ops_2f32.norm(a)}")


if __name__ == "__main__":
    main()
