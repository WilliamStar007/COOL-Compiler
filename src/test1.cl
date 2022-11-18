-- Good Tests: Test1.cl

class Main inherits IO {
	-- TEST ASSIGNMENTS


	true_bool : Bool <- true;
	false_bool : Bool <- false;
	one : Int <- 1;
	helloThere : String <- "Hello There";
	theNewTest : TestNew <- (new TestNew).init("Howdy", "Bros");
	theNewTest2 : TestNew <- (new TestNew).init("Hello", "There");
	theNewTest3 : TestNew <- (new TestNew).init("Good", "Bye");
	while1 : Int;
	while2 : Int;
	while3 : Int;
	while4 : Int;
	while5 : Int;
	while6 : Int;
	while7 : Int;

	-- TEST: many parameters
	func1(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
	i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int, x : Int, y : Int, z : Int) : Int
	{{a <- in_int(); a;}};
	func2(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
		i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int, x : Int, y : Int, z : Int) : Int
		{{
			a <- in_int();
			b <- in_int();
			func3(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w , x, y);}};
		func3(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
			i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int, x : Int, y : Int) : Int
			{ {
				a <- in_int();
				b <- in_int();
				c <- in_int();
				d <- in_int();
				func4(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w, x);}};
	func4(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
				i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int, x : Int) : Int
				{{
					a <- in_int();
					b <- in_int();
					c <- in_int();
					func5(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w);}};
	func5(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
					i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int) : Int
					{{
						a <- in_int();
						b <- in_int();
						c <- in_int();
						d <- in_int();
						
						a;}};

	funcStr1(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : String, m : String, n : String, o : String, p : String, q : String, r : String, s : String, t : String, u : String, v: String, w : String, x : String, y : String, z : String) : String
		{{
			b <- in_string();
			c <- in_string();
			z <- in_string();
			a;}};

		funcStr2(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String,
			i : String, j : String, k : String, l : String, m : String, n : String, o : String, p : String, q : String, r : String, s : String, t : String, u : String, v: String, w : String, x : String, y : String, z : String) : String
			{{
				
				b <- in_string();
				c <- in_string();
				z <- in_string();
				funcStr3(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w , x, y);}};
			funcStr3(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : String, m : String, n : String, o : String, p : String, q : String, r : String, s : String, t : String, u : String, v: String, w : String, x : String, y : String) : String
				{{
					b <- in_string();
					c <- in_string();
					y <- in_string();
					funcStr4(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w , x);}};
		funcStr4(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String,
					i : String, j : String, k : String, l : String, m : String, n : String, o : String, p : String, q : String, r : String, s : String, t : String, u : String, v: String, w : String, x : String) : String
					{{
						
						b <- in_string();
						c <- in_string();
						x <- in_string();
						funcStr5(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w);}};
		funcStr5(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String,
						i : String, j : String, k : String, l : String, m : String, n : String, o : String, p : String, q : String, r : String, s : String, t : String, u : String, v: String, w : String) : String
						{{

							b <- in_string();
							c <- in_string();
							w <- in_string();
							a;}};



						funcMix1(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Bool, t : Bool, u : Bool, v: TestNew, w : TestNew, x : TestNew, y : TestNew, z : TestNew) : TestNew
						{{
							
							a <- in_string();
							b <- in_string();
							l <- in_int();
							r <- in_int();
							v;}};
				
						funcMix2(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Bool, t : Bool, u : Bool, v: TestNew, w : TestNew, x : TestNew, y : TestNew, z : TestNew) : TestNew
							{{
								a <- in_string();
								b <- in_string();
								l <- in_int();
								m <- in_int();
								n <- in_int();
								r <- in_int();
								funcMix3(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w , x, y);}};
							funcMix3(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Bool, t : Bool, u : Bool, v: TestNew, w : TestNew, x : TestNew, y : TestNew) : TestNew
								{{
									
									a <- in_string();
								b <- in_string();
								l <- in_int();
								m <- in_int();
								n <- in_int();
								r <- in_int();
									funcMix4(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w , x);}};
						funcMix4(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Bool, t : Bool, u : Bool, v: TestNew, w : TestNew, x : TestNew) : TestNew
									{{
										
										
										a <- in_string();
										b <- in_string();
										l <- in_int();
										m <- in_int();
										n <- in_int();
										r <- in_int();
										funcMix5(a, b, c, d, e, f, g , h, i , j , k , l, m, n, o , p, q , r ,s, t, u , v , w);}};
						funcMix5(a : String, b : String, c : String, d : String, e : String, f : String, g : String, h : String, i : String, j : String, k : String, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Bool, t : Bool, u : Bool, v: TestNew, w : TestNew) : TestNew
										{{
											a <- in_string();
											b <- in_string();
											l <- in_int();
											m <- in_int();
											n <- in_int();
											r <- in_int();
											
											w;}};

			funcRecursion(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int, h : Int,
				i : Int, j : Int, k : Int, l : Int, m : Int, n : Int, o : Int, p : Int, q : Int, r : Int, s : Int, t : Int, u : Int, v: Int, w : Int, x : Int, y : Int, z : Int,
				a1 : Int, b1 : Int, c1 : Int, d1 : Int, e1 : Int, f1 : Int, g1 : Int, h1 : Int,
				i1 : Int, j1 : Int, k1 : Int, l1 : Int, m1 : Int, n1 : Int, o1 : Int, p1 : Int, q1 : Int, r1 : Int, s1 : Int, t1 : Int, u1 : Int, v1: Int, w1 : Int, x1 : Int, y1 : Int, z1 : Int,
				a2 : Int, b2 : Int, c2 : Int, d2 : Int, e2 : Int, f2 : Int, g2 : Int, h2 : Int,
				i2 : Int, j2 : Int, k2 : Int, l2 : Int, m2 : Int, n2 : Int, o2 : Int, p2 : Int, q2 : Int, r2 : Int, s2 : Int, t2 : Int, u2 : Int, v2 : Int, w2 : Int, x2 : Int, y2 : Int, z2 : Int,
				a3 : Int, b3 : Int, c3 : Int, d3: Int, e3 : Int, f3 : Int, g3 : Int, h3 : Int,
				i3 : Int, j3 : Int, k3 : Int, l3 : Int, m3 : Int, n3 : Int, o3 : Int, p3 : Int, q3 : Int, r3 : Int, s3 : Int, t3: Int, u3 : Int, v3 : Int, w3 : Int, x3 : Int, y3 : Int, z3 : Int) : Int
				{{
					a <- in_int();
					b <- in_int();
					c <- in_int();
					d <- in_int();
					e <- in_int();
					f <- in_int();
					g <- in_int();
					h <- in_int();
					i <- in_int();
					j <- in_int();
					k <- in_int();
					l <- in_int();
					m <- in_int();
					n <- in_int();
					o <- in_int();
					p <- in_int();
					q <- in_int();
					r <- in_int();
					s <- in_int();
					t <- in_int();
					u <- in_int();
					v <- in_int();
					w <- in_int();
					x <- in_int();
					y <- in_int();
					z <- in_int();
					a1 <- in_int();
					b1 <- in_int();
					c1 <- in_int();
					d1 <- in_int();
					e1 <- in_int();
					f1 <- in_int();
					g1 <- in_int();
					h1 <- in_int();
					i1 <- in_int();
					j1 <- in_int();
					k1 <- in_int();
					l1 <- in_int();
					m1 <- in_int();
					n1 <- in_int();
					o1 <- in_int();
					p1 <- in_int();
					q1 <- in_int();
					r1 <- in_int();
					s1 <- in_int();
					t1 <- in_int();
					u1 <- in_int();
					v1 <- in_int();
					w1 <- in_int();
					x1 <- in_int();
					y1 <- in_int();
					z1 <- in_int();
					
					if a = 0 then 1 else funcRecursion(a - 1,  1 + 2 ,  2 * 2, 3 + 77,  88 * 7, 7 + 7 , g , h, i, j, k , l , m , n, o , p, q, r, s, t, u, v , w, x, y, z, a1, b1 , c1, d1, e1, f1 , g1 , h1, i1, j1, k1 , l1 , m1 , n1, o1 , p1, q1, r1, s1, t1, u1, v1 , w1, x1, y1, z1, a2, b2 , c2, d2, e2, 5 * 6 * 7 * 8 , g2 , h2, i2, j2, k2 , l2 , m2 , n2, o2 , p2, q2, r2, s2, t2, u2, v2 , 7 * 7 + 7, x2, y2, z2,  a3, b3 , c3, d3, e3, f3 , g3 , h3, i3, j3, k3 , l3 , m3 , 5 * 5 * 5 + 2, o3 , p3, q3, r3, s3, t3, u3, v3 , w3, x3, y3, z3 ) fi;}};
			
	-- TEST STRING INTERNALS
	string1 : String <- "hello";
	string2 : String <- "world";
	string3 : String <- "Hello";
	string4 : String <- "World";
	string5 : String <- "HELLO";
	string6 : String <- "WORLD";
	string7 : String <- "HI";
	string8 : String <- "THERE";
	string9 : String <- "Howdy";
	string10 : String <- "Bro";
	string11 : String <- "Aye";
	x : Int;
	test4 : Test4 <- new Test4;
	someObj : Object <- new Object;
	getA() : String {theNewTest.getA()};


	main() : Object {{


	-- in int
	x <- in_int();
	string11 <- in_string();
	
		-- Functions with many parameters
	func1(88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * 3 + 2 * 7 * 8 + 1, 7  * 7 + 2 + 6, 2 * 2 + 9 * 2 + 3, 7 * 7 * 2 + 4 + 3 + 2 + 1, 1 * 2 + (3 + 5 + 1) + 88888, 1 * 2 + 3 * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x);

	func2(88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * 3 + 2 * 7 * 8 + 1, 7  * 7 + 2 + 6, 2 * 2 + 9 * 2 + 3, 7 * 7 * 2 + 4 + 3 + 2 + 1, 1 * 2 + (3 + 5 + 1) + 88888, 1 * 2 + 3 * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x);

	funcStr1("hello","there", "my friend", "how", "is", "your", "day", "going?", 
"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "rs");

	funcStr2("hello","there", "my friend", "how", "is", "your", "day", "going?", 
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "rs");

	funcMix1("hello","there", "my friend", "how", "is", "your", "day", "going?", 
	"a", "b", "c", 88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7,   true_bool, false_bool, false, theNewTest, theNewTest2, theNewTest3, (new TestNew).init("A", "Test"), (new TestNew).init("Some", "Test"));
	funcMix2("hello","there", "my friend", "how", "is", "your", "day", "going?", 
	"a", "b", "c", 88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7,   true_bool, false_bool, false, theNewTest, theNewTest2, theNewTest3, (new TestNew).init("A", "Test"), (new TestNew).init("Some", "Test"));


	funcRecursion(88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * 3 + 2 * 7 * 8 + 1, 7  * 7 + 2 + 6, 2 * 2 + 9 * 2 + 3, 7 * 7 * 2 + 4 + 3 + 2 + 1, 1 * 2 + (3 + 5 + 1) + 88888, 1 * 2 + 3 * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x,
	87 * 8, 1 + 3, 2 * 3 * 7 + 8,  2 / 4,  1 * 5 * (3 + 4) + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * (3 + 2 * 7) * 8 + 1, 7  * 7 + 2 + 6, 2 * 2 + 9 * 2 + 3, 7 * 7 * 2 + 4 + 3 + (2 + 1), 1 * 2 + (3 + 5 + 1) + 88888, 1 * (2 + 3) * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x,
	88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * 3 + 2 * 7 * 8 + 1, 7  * 7 + 2 + 6, 2 * 2 + 9 * 2 + 3, 7 * 7 * 2 + 4 + 3 + 2 + 1, 1 * 2 + (3 + 5 + 1) + 88888, 1 * 2 + 3 * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x,
	88 * 8, 1 + 2, 2 * 3 * 7 + 8,  2 / 2,  1 * 2 * 3 + 4 + 5 / 6, 1 / 2 , 7 * 7, 88 + 8, 7 * 7,3 * 2 + 6, 2 * (3 + 2) * 7 * (8 + 1), 7  * (7 + 2 + 6), 2 * 2 + 9 * 2 + 3, 7 * 7 * (2 + 4) + 3 + 2 + 1, 1 * 2 + (3 + 5 + 1) + 88888, 1 * 2 + 3 * 4 *5 * 6 * 8, 1 + 2, 5 * 5 * 2, 1 * 2 + 2, x, x + 1, x + 3, 77 * 77, 1000 * 3, (1 * 2 * 3 + 4) / 5, x);
	-- Multiple if branches
	if true_bool then 
		if false_bool then if true_bool then if false_bool then x <- x * 88 else x <- x * 77 fi else x <- x * 8 fi
		else x <- x + 9 * 8 * 7 fi
		else x <- x * 77 * 88 fi;

		if true_bool then 
		if false_bool then if true_bool then if false_bool then if true_bool then if false_bool then if true_bool then if false_bool then if true_bool
		then x <- 9 + 9
		else x <- 10 + 10 fi
		else x <- 10 + 20 fi
		else x <- 10 * 20 fi
		else x <- 10 - 2 * 10 fi
		else x <- 10 * 2 + 2 fi
		else x <- x * 77 fi 
		else x <- x * 8 fi
		else x <- x + 9 * 8 * 7 fi
		else x <- x * 77 * 88 fi;

		-- WHILE LOOOPS
		while while1 < 100 loop {
					while1 <- while1 + 1;
					while while2 < 100 loop {
						while2 <- while2 + 1;
						while while3 < 100 loop {
									while3  <- while3 + 1;
									while while4 < 100 loop {
										while4 <- while4 + 1;
										while while5 < 100 loop {
											while5 <- while5 + 1;
											while while6 < 100 loop {
												while6 <- while6 + 1;
												while while7 < 100 loop {
													while7 <- while7 + 1;
												} pool;
											} pool;
										} pool;
									} pool;
						} pool;
					} pool ;
					while2 <- 0;
					while3 <- 0;
					while4 <- 0;
					while5 <- 0;
					while6 <- 0;
					while7 <- 0;
					x <- in_int();
					string11 <- in_string();
		} pool;


	-- TEST STRING INTERNALS
	out_int(x);
	test4.someFunc();
	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string1.length();
	string1 <- in_string();
	out_string("x : ");
	out_int(x);
	out_string("\n");
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	out_string("string11 : ");
	out_string(string11);
	out_string("\n");
	x <- string11.length();
	string11 <- in_string();
	out_string("x : ");
	out_int(x);
	out_string("\n");
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("string5 : ");
	out_string(string5);
	out_string("\n");
	x <- string5.length();
	string5 <- in_string();
	out_string("x : ");
	out_int(x);
	out_string("\n");
  -- TEST ASSIGNMENTS
		-- big expression
	x <-	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29;
	out_int(x);
	x <- in_int();
		-- Arithmetic
		-- Many expressions
		x <-5 + 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 7 / 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		
		x <- 6 * 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 5 - 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 5 - 2 + 7 * 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
	x <-	2 / 7;
	out_string("x : ");
	out_int(x);
	out_string("\n");
	x <- in_int();
		x <-1 / 7;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <-2 + 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <-7 /2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <-1 / 8;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <-1 / 9; 
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <-1 / 10;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 11;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 12;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 13;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1/ 14;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 15;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 16;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 17;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x <- 1 / 18;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- in_int();
		x  <- 1 * 19;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1  * 20;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 *  21;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 * 22;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 * 23;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29);
		out_string("x : ");
		out_int(x);
		out_string("\n");
		-- TEST: bool assigned in bool
		let some_bool: Bool <- true in some_bool;

		-- TEST: bool comparison
		if true_bool = false_bool then x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4  else x <- 5 * 5 + 7 / 2 - 5 * 1 - 2  fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		if true_bool = true then x <- in_int()  else x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4  fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		if false_bool = false then x <- 10 else x <- in_int() fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		-- TEST: copy self dispatch
		copy();

		-- TEST: copy initialize object
		(new Object).copy();
		-- TEST:Hello
		out_string("Hello, World.\n");


		-- TEST: nested let
		let a : Int <- 0 in 
			let b : Int <- 1 in
					let c : Int <- 2 in
							let d : Int <- 3 in
									let e : Bool <- false in
											let f : Bool <- true in
													let g : String <- "Hello" in
														  g <- in_string();
-- TEST normal methods
	one.copy();
 helloThere.copy(); 
 helloThere <- in_string();
 true_bool.copy(); 
	helloThere.length();


	-- TEST NEW and test New self dispatch
	theNewTest <- new TestNew;
	getA();
	if theNewTest.testThis().testThat().testThose().getA() = theNewTest.getB()
	then out_string("=)\n").out_string((new TestNew).getA())
	else out_string("=(\n").out_string((new TestNew).getB())
	fi;
	

	-- TEST not expression
	if not (theNewTest.testThis().testThat().testThose().getA() = theNewTest.getB())
	then out_string("=)\n").out_string((new TestNew).getA())
	else out_string("=(\n").out_string((new TestNew).getB())
	fi;

	if not (not(true_bool = false_bool)) then x <- 10 * 10 * 10 + 5 / 2 else x <- in_int() fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");
	if not(not (not (true_bool = true))) then x <- in_int() else x <- 10122432 fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");
	if not(not(not(not (not (false_bool = false))))) then x <- in_int() else x <- 4 fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");

	

	-- TEST: one nested expression with arith ops
	-- TEST: eval order arith
	x <- (5 * 5 + 7 / 2- 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / (29 + (	5 * 5 + 7 / 2 - (5 * (1 - (2 + (3 / (4 * (5 + 6) - 7)* 8 / 9) + 10) - 11) * 12) / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + (7 / (2 - (5 * (1 - 2) + 3) / 4 )* 5) + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - (19 * (20 / (21 + (22 - 23) * 24) / 25) + 26) - 27) * 28) / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29))
	- (	5 * 5 + (7 / 2 - (5 * (1 - (2 + 3 / 4 )* 5 )+ 6) - 7) * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - 19 * 20 / 21 + 22 - 23) * 24) / 25 + 26 - 27  * 28 / 29));
	out_string("x : ");
	out_int(x);
	out_string("\n");
	-- TEST abort()
	abort();
	out_string("Hello");
	abort();
	}
	};

};

class Test1 inherits IO {

		-- TEST: new and self type
		x : Int;
		someStr : String;
		some_number: Int <- helloThere(new SELF_TYPE);
		helloThere(value:Test1):Int { 5000 };
	other_main(): SELF_TYPE {{
 out_string("Hello, World.\n");
 x <- in_int();
 someStr <- in_string();
 self;

	}
	};
};

class TestNew inherits IO{

	string1 : String <- "hello";
	string2 : String <- "world";
	string3 : String <- "Hello";
	string4 : String <- "World";
	string5 : String <- "HELLO";
	string6 : String <- "WORLD";
	string7 : String <- "HI";
	string8 : String <- "THERE";
	string9 : String <- "Howdy";
	string10 : String <- "Bro";
	string11 : String <- "Aye";

	a : String <- "Test";
	b : String <- "New";
	init(valA : String, valB : String) : TestNew {
		{
		out_string(a);
		out_string(b);
		
		a <- valA;
		b <- valB;
		out_string(a);
		out_string(b);
		a <- in_string();
		b <- in_string();
		out_string(a);
		out_string(b);
		self;
		}
	};

	exihbit(): Object {{
		a <- in_string();
		b <- in_string();
		out_int(1).out_string(a).out_string(b).out_int(1);
	}
	};
	testThis(): TestNew {
		{
		out_string(a);
		a <- "Hi";
		out_string(a);
		a <- in_string();
		out_string(a);
		self;
		}
	};

	testThat(): TestNew {
		{
		out_string(b);
		b <- "Hello";
		out_string(b);
		b <- in_string();
		out_string(b);
		self;
		}
	};
	testThose() : TestNew {
		{
			
			
			out_string("a : ");
			out_string(a);
			out_string("\n");
			out_string("b : ");
			out_string(b);
			out_string("\n");
			a <- "Hello";
			b <- "New";
			out_string("a : ");
			out_string(a);
			out_string("\n");
			out_string("b : ");
			out_string(b);
			out_string("\n");
			a <- in_string();
			b <- in_string();
			out_string("a : ");
			out_string(a);
			out_string("\n");
			out_string("b : ");
			out_string(b);
			out_string("\n");
			self;
		}
	};

	getA() : String {{
		out_string("a : ");
		out_string(a);
		out_string("\n");
		a <- in_string();
		out_string("a : ");
		out_string(a);
		out_string("\n");

		a;
	}};
	getB() : String { {
		out_string("b : ");
		out_string(b);
		out_string("\n");
		b <- in_string();
		out_string("b : ");
		out_string(b);
		out_string("\n");
		b;
	}
	};
	


};

class Test4 inherits TestNew {

	string12 : String <- "hola";
	string13 : String <- "el mundo";
	string14: String <- "Hola";
	string15: String <- "El mundo";
	string16: String <- "HOLA";
	string17: String <- "EL MUNDO";
	string18 : String <- "holA";
	string19: String <- "Buenos ";
	string20: String <- "Buenas Tardes";
	string21 : String <- "Hola a todos ";
	string22 : String <- "Hola a TODOS";
	x : Int;
	shallowCopy : String <- "copy";
	deepCopy : Copy <- (new Copy).init(1, 2, 3);
	theDeepCopy : Copy;
	copy2 : Copy;
	copy3 : Copy;
	someCopy: Copy <- (new Copy).init(4, 5, 6);
	otherCopy : Copy <- (new Copy).init(7, 8, 9);

	void1 : Copy;
	void2 : Copy;
	nonVoid : Copy <- otherCopy;

	worker : Employee <- (new Employee).init1("The rain", 1000, 100000000);
	someFunc() :  Object {


		{

				-- TEST STRING INTERNALS
	string12 <- string13.concat(string14);
	out_string("string12 : ");
	out_string(string12);
	out_string("\n");
	string12 <- in_string();
	string12 <- string12.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	out_string("string12 : ");
	out_string(string12);
	out_string("\n");
	x <- in_int();
	x <- string12.length();
	string12 <- in_string();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	string22 <- string12.concat(string13).concat(string14).concat(string15).concat(string16).concat(string17).concat(string18).concat(string19).concat(string20).concat(string21).concat(string22);
	out_string("string22 : ");
	out_string(string22);
	out_string("\n");
	

	x <- string22.length();
	string22 <- in_string();
	out_string("class Test 4 x: ");
	out_int(x);
	out_string("\n");
	x <- in_int();
	string16 <- string22.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("string16: ");
	out_string(string16);
	out_string("\n");
	

	x <- string16.length();
	string16 <- in_string();
	out_string("class Test 4 x: ");
	out_int(x);
	out_string("\n");
	out_string("TEST 4");
	x <- in_int();

	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	
	x <- string1.length();
	string1 <- in_string();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	x <- in_int();
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	out_string("class Test4 string11 : ");
	out_string(string11);
	out_string("\n");
	x <- string11.length();
	string11 <- in_string();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	x <- in_int();
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("class Test4 string5 : ");
	out_string(string5);
	out_string("\n");
	x <- string5.length();
	string5 <- in_string();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	x <- in_int();
	shallowCopy <- string11.copy().concat((new String)).copy();
	theDeepCopy <- deepCopy.copy1();

	theDeepCopy.printA();
	theDeepCopy.printA();
	deepCopy.printA();
	copy2 <- someCopy.copy1().copy1().copy1().copy1();
	copy3 <- (new Copy).init(copy2.getA(), deepCopy.copy1().getB(), otherCopy.copy1().getC());
	copy3.printA();

	-- Object comparison
	if theDeepCopy < someCopy then theDeepCopy.printSomething("Deep Copy less")
	else someCopy.printSomething("Shallow copy less") fi;
	if theDeepCopy = someCopy then theDeepCopy.printSomething("Deeep and shallow equal")
	else someCopy.printSomething("Not equal") fi;

	if void1 < void2 then theDeepCopy.printSomething("void1 is less") else 
	theDeepCopy.printSomething("void2 is less") fi;
	if void1 = void2 then theDeepCopy.printSomething("void1 equals void2") else 
	theDeepCopy.printSomething("void1 does not equal void2") fi;
	if void1 < theDeepCopy then  theDeepCopy.printSomething("void1 is less than deep copy")
	else theDeepCopy.printSomething("void1 is greater than deep copy") fi;
	if void1 = theDeepCopy then  theDeepCopy.printSomething("void1 is equal to deep copy")
	else theDeepCopy.printSomething("void1 is not equal to deep copy") fi;
	if void1 < nonVoid then theDeepCopy.printSomething("void1 is less than nonVoid")
	else theDeepCopy.printSomething("nonVoid is less than void1") fi;
	if void1 = nonVoid then theDeepCopy.printSomething("void1 is equal to nonVoid")
	else theDeepCopy.printSomething("void1 is not equal to nonVoid") fi;
		}
	};

};


class Copy inherits IO {
a : Int;
b : Int;
c : Int;
init(valA : Int, valB : Int, valC : Int) : SELF_TYPE {
	{ 
		out_string("a : ");
		out_int(a);
		out_string("\n");
		out_string("b : ");
		out_int(b);
		out_string("\n");
		out_string("c : ");
		out_int(c);
		out_string("\n");
		a <- valA;
		b <- valB;
		c <- valC;
		a <- in_int();
		b <- in_int();
		c <- in_int();
		out_string("a : ");
		out_int(a);
		out_string("\n");
		out_string("b : ");
		out_int(b);
		out_string("\n");
		out_string("c : ");
		out_int(c);
		out_string("\n");
		self;
	}
};
 copy1() : Copy {{
	
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");

		a <- in_int();
		b <- in_int();
		c <- in_int();
		out_string("class Copy a: ");
		out_int(a);
		out_string("\n");
		out_string("class Copy b: ");
		out_int(b);
		out_string("\n");
		out_string("class Copy c: ");
		out_int(c);
		out_string("\n");
	(self).init(a, b, c);

}};

 printA() : Object {out_int(a)};

 getA()  : Int {{
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	a <- in_int();
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	a;

}};
 getB() : Int {{
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	b <- in_int();
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	b;

}};
 getC() : Int {{
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	c <- in_int();
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	c;
}};
 printSomething(output: String) : Object {{
	
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	out_string(output);}};

};

class Person inherits IO {
	name : String;
	age : Int;
	init(nameVal : String, ageVal : Int) : SELF_TYPE {
		{
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			name <- nameVal;
			age <- ageVal;
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			name <- in_string();
			age <- in_int();
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			self;
		}
	};

};

class Employee inherits Person {
	salary : Int;
	init1(nameVal : String, ageVal: Int, salaryVal: Int) : SELF_TYPE {
		{
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			out_string("class Person salary: ");
		  out_int(salary);
		  out_string("\n");

		name <- nameVal;
		age <- ageVal;
		salary <- salaryVal;

			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			out_string("class Person salary: ");
		  out_int(salary);
		  out_string("\n");
			name <- in_string();
			age <- in_int();
			salary <- in_int();
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			out_string("class Person salary: ");
		  out_int(salary);
		  out_string("\n");
			self;
		}

	};
};