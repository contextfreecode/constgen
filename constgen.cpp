#include <array>
#include <cmath>
#include <iostream>
#include <numeric>

template<typename Val, std::size_t Size>
using Vec = std::array<Val, Size>;

template<typename Val, std::size_t Size>
auto dot(const Vec<Val, Size>& a, const Vec<Val, Size>& b) -> Val {
    return std::transform_reduce(a.begin(), a.end(), b.cbegin(), Val{0});
}

// template<std::size_t Size, typename Val>
template<typename Val, std::size_t Size>
auto norm(const Vec<Val, Size>& a) -> Val {
    return std::sqrt(dot(a, a));
}

auto main() -> int {
    auto a = Vec<double, 2>{1.5, 2};
    std::cout << norm(a) << std::endl;
}
