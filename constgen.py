from typing import Tuple, TypeVar, cast


Val = TypeVar("Val")


def norm_gen(size: int):
    # Vec = Tuple.__getitem__((Val,) * size)
    Vec = Tuple[Val, Val]

    def norm(vec: Vec) -> Val:
        val = cast[Val](0)
        for i in range(size):
            val += vec[i] * vec[i]
        return val / size

    return norm
