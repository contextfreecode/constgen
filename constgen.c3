module contextfree::vec;
import std::math, std::io;

// We could use the built in vector type for this,
// but it would be less interesting.
typedef Vec <Type, SIZE> = Type[SIZE];

fn Type Vec.dot(&self, Vec other)
{
	Type result;
	foreach (i, v : *self) result += v * other[i];
	return result;
}

// C3 short body syntax.
fn Type Vec.norm(Vec v) => math::sqrt(v.dot(v));

fn void main()
{
	Vec{float, 2} a = { 1.5, 2 };
	io::printfn("norm: %s", a.norm());
	// Using macros
	float[2] b = { 1.5, 2 };
	io::printfn("norm: %s", norm(b));
}

// Alternative macro solution, with some simple checks

<*
 @require $Typeof(v1) == $Typeof(v2) : "Expected both values to be the same type"
*>
macro dot(v1, v2)
{
	$Typeof(v1[0]) result;
	foreach (i, v : v1) result += v * v2[i];
	return result;
}

macro norm(v)
{
	return math::sqrt(dot(v, v));
}
