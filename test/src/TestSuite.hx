import massive.munit.TestSuite;

import PartialTest;
import PartialTest2;
import ReactMacroTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */
class TestSuite extends massive.munit.TestSuite
{
	public function new()
	{
		super();

		add(PartialTest);
		add(PartialTest2);
		add(ReactMacroTest);
	}
}
