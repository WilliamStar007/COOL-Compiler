-- Bad Tests: Test3.cl
class Main inherits IO {
  y : String <- "hello";
	main() : Object {{
    
		-- Division by zero
		5 / 0;
    -- subtring out of range
    "test".substr(0,10);

    -- case without matching branch
    case y of 
      a : A => 0;
      b : B => 1;
      c : C => 2;
      d : D => 3;
      esac;

    
	}


	};

};

class A {};
class B inherits A {};
class C inherits B {};
class D inherits C {};