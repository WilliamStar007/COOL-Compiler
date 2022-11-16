-- Bad Tests: Test3.cl
class Main inherits IO {
  y : String <- "hello";
  g : B;
	main() : Object {{
    
	--TEST: Division by zero. DONE
  out_string("5 / 0");
		5 / 0;
  -- TEST: subtring out of range. DONE
   "test".substr(0,10);
  -- TEST: dynamic dispatch on void. DONE
    g.copy();

  --TEST: static dispatch on void. DONE
    g@A.myLetter();
  -- TEST:  case without matching branch. DONE
    case y of 
      a : A => 0;
      b : B => 1;
      c : C => 2;
      d : D => 3;
      esac;
-- TEST: case on void
    case g of
    a : A => 0;
      b : B => 1;
      c : C => 2;
      d : D => 3;
      esac;

   

    
	}


	};

};

class A {

  myLetter() : String {"A"};
};
class B inherits A {};
class C inherits B {};
class D inherits C {};