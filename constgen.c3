// Written for C3 0.7.0 and higher.
// C3 pre-0.7.0 uses (< >) rather than { } for generics.
module contextfree::vec{Type, SIZE};
import std::math;

// We could use the built in vector type for this,
// but it would be less interesting.
distinct Vec = Type[SIZE];

fn Type Vec.dot(&self, Vec other)
{
	Type result;
	foreach (i, v : *self) result += v * other[i];
	return result;
}

// C3 short body syntax.
fn Type Vec.norm(Vec v) => math::sqrt(v.dot(v));

module contextfree::vectest;
import contextfree::vec, std::io, std::math;

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
 @require values::@is_same_type(v1, v2) : "Expected both values to be the same type"
*>
macro dot(v1, v2)
{
	$typeof(v1[0]) result;
	foreach (i, v : v1) result += v * v2[i];
	return result;
}

macro norm(v)
{
	return math::sqrt(dot(v, v));
}