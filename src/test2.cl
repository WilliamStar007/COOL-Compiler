-- Good Tests: Test2.cl
class Main inherits IO {
	-- Test Assignments
	one : One;
	two : Two;
	three : Three <- new Three;
	numOne : String <- "1";
	hello : String <- "hello";
	main() : Object {{
    
		-- TEST: void comparision and void with non void comparison
		if one = two then out_string("True") else out_string("FALSE") fi;
		if one =  three then out_string("TRUE") else out_string("FALSE") fi;
		-- TEST substring ok
		"test".substr(0, 4);
		-- TEST: string comparison, non-void comparison
		if numOne = hello then out_string("True") else out_string("FALSE") fi;
		if hello =  "hello" then out_string("TRUE") else out_string("FALSE") fi;
		if hello =  "HELLO" then out_string("TRUE") else out_string("FALSE") fi;
	}

	};

};
class One {};
class Two {};
class Three {};