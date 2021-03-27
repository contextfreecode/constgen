import math
import strformat

func dot[Size: static int, Val](a, b: array[Size, Val]): Val =
  var sum: Val = 0
  for i, x in a.pairs:
    sum += x * b[i]
  sum

func norm[Size: static int, Val](a: array[Size, Val]): Val =
  dot(a, a).sqrt()

# func norm2f64(x, y: float64): float64 {.exportc.} =
#   norm([x, y])

proc main() =
  var a = [1.5, 2]
  echo fmt"norm: {norm(a)}"

main()
