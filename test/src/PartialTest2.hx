package;

import massive.munit.Assert;
import react.Partial;

private typedef ABCD = {
	a:String,
	b:String,
	c:FromString,
	d:FromIntWithFunction
}

private abstract FromString(Dynamic) from String {}

private abstract FromIntWithFunction(String) {
	@:from
	static public function fromInt(i:Int)
	{
		return cast (i == 42 ? "the answer" : "something");
	}
}

class PartialTest2
{
	public function new() {}

	@Test
	public function fields_keep_their_type()
	{
		AssertTools.assertCompilationFails({
			var test:Partial<ABCD> = {a: 42};
		});
	}

	@Test
	public function cannot_add_extra_fields()
	{
		AssertTools.assertCompilationFails({
			var test:Partial<ABCD> = {a: "42", e: "test"};
		});
	}
}
