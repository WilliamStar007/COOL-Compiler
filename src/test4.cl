-- Good Tests: Test4.cl


class Main inherits IO {
	testA : TestA <- new TestA;
	testB : TestB <- new TestB;
	testC : TestC <- new TestC;
	testD : TestD <- new TestD;
	testE : TestE <- new TestE;
	testF : TestF <- new TestF;
	testG : TestG <- new TestG;
	testH : TestH <- new TestH;
	testI : TestI <- new TestI;
	testJ : TestJ <- new TestJ;
	testK : TestK <- new TestK;
	testL : TestL <- new TestL;
	testM : TestM <- new  TestM;
	testN : TestN <- new TestN;
	testO : TestO <- new TestO;
	testP : TestP <- new TestP;
	testQ : TestQ <- new TestQ;
	testR : TestR <- new TestR;
	testS : TestS <- new TestS;
	testT : TestT <- new TestT;
	testU : TestU <- new TestU;
	testV : TestV <- new TestV;
	testW : TestW <- new TestW;
	testX : TestX <- new TestX;
	testY : TestY <- new TestY;
	someIndex : Int <- 0;
  x : Int <- 0;
  y : Int <- 1;
  z : Int <- 2;
  a : Int <- new Int;
  b : Int <- 4;
  c : Int <- new Int;
  d : Int <- 6;
  e : Int <- new Int;
  f : Int <- 8;
  g : Int <- new Int;
  h : Int <- 10;
  i : Int <- new Int;
  j : Int <- 12;
  k : Int <- new Int;
  l : Int <- 14;
  m : Int <- 15;
  n : Int <- 16;
  o : Int <- 17;
  p : Int <- 18;
  q : Int <- 19;
  r : Int <- 20;
  s : Int <- 21;
  t : Int <- 22;
  u : Int <- 23;
  v : Int <- 24;
  w : Int <- 25;
  
  b1 : Int <- 4;
  c1 : Int <- new Int;
  d1 : Int <- 6;
  e1 : Int <- new Int;
  f1 : Int <- 8;
  g1 : Int <- new Int;
  h1 : Int <- 10;
  i1 : Int <- new Int;
  j1 : Int <- 12;
  k1 : Int <- new Int;
  l1 : Int <- 14;
  m1 : Int <- 15;
  n1 : Int <- 16;
  o1 : Int <- 17;
  p1 : Int <- 18;
  q1 : Int <- 19;
  r1 : Int <- 20;
  s1 : Int <- 21;
  t1 : Int <- 22;
  u1 : Int <- 23;
  v1 : Int <- 24;
  w1 : Int <- 25;
  
  b2 : Int <- 4;
  c2 : Int <- new Int;
  d2 : Int <- 6;
  e2 : Int <- new Int;
  f2 : Int <- 8;
  g2 : Int <- new Int;
  h2 : Int <- 10;
  i2 : Int <- new Int;
  j2 : Int <- 12;
  k2 : Int <- new Int;
  l2 : Int <- 14;
  m2 : Int <- 15;
  n2 : Int <- 16;
  o2 : Int <- 17;
  p2 : Int <- 18;
  q2 : Int <- 19;
  r2 : Int <- 20;
  s2 : Int <- 21;
  t2 : Int <- 22;
  u2 : Int <- 23;
  v2 : Int <- 24;
  w2 : Int <- 25;
  
  b3 : Int <- 4;
  c3 : Int <- new Int;
  d3 : Int <- 6;
  e3 : Int <- new Int;
  f3 : Int <- 8;
  g3 : Int <- new Int;
  h3 : Int <- 10;
  i3 : Int <- new Int;
  j3 : Int <- 12;
  k3 : Int <- new Int;
  l3 : Int <- 14;
  m3 : Int <- 15;
  n3 : Int <- 16;
  o3 : Int <- 17;
  p3 : Int <- 18;
  q3 : Int <- 19;
  r3 : Int <- 20;
  s3 : Int <- 21;
  t3 : Int <- 22;
  u3 : Int <- 23;
  v3 : Int <- 24;
  w3 : Int <- 25;
  
  
  b4 : Int <- 4;
  c4 : Int <- new Int;
  d4 : Int <- 6;
  e4 : Int <- new Int;
  f4 : Int <- 8;
  g4 : Int <- new Int;
  h4 : Int <- 10;
  i4 : Int <- new Int;
  j4 : Int <- 12;
  k4 : Int <- new Int;
  l4 : Int <- 14;
  m4 : Int <- 15;
  n4 : Int <- 16;
  o4 : Int <- 17;
  p4 : Int <- 18;
  q4 : Int <- 19;
  r4 : Int <- 20;
  s4 : Int <- 21;
  t4 : Int <- 22;
  u4 : Int <- 23;
  v4 : Int <- 24;
  w4 : Int <- 25;
  
  b5 : Int <- 4;
  c5 : Int <- new Int;
  d5 : Int <- 6;
  e5 : Int <- new Int;
  f5 : Int <- 8;
  g5 : Int <- new Int;
  h5 : Int <- 10;
  i5 : Int <- new Int;
  j5 : Int <- 12;
  k5 : Int <- new Int;
  l5 : Int <- 14;
  m5 : Int <- 15;
  n5 : Int <- 16;
  o5 : Int <- 17;
  p5 : Int <- 18;
  q5 : Int <- 19;
  r5 : Int <- 20;
  s5 : Int <- 21;
  t5 : Int <- 22;
  u5 : Int <- 23;
  v5 : Int <- 24;
  w5 : Int <- 25;
  
  
  commonExpr: Int <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
  * (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
  / (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
  + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
  - (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29);
  
  someTruth : Bool <- new Bool;
  otherTruth : Bool <- new Bool;
  someTruth1 : Bool <- true;
  otherTruth1 : Bool <- false;
  someTruth2 : Bool <- new Bool;
  otherTruth2 : Bool <- new Bool;
  someTruth3 : Bool <- true;
  otherTruth3 : Bool <- false;
  someTruth4 : Bool <- new Bool;
  otherTruth4 : Bool <- new Bool;
  someTruth5 : Bool <- true;
  otherTruth5 : Bool <- false;
  someTruth6 : Bool <- new Bool;
  otherTruth6 : Bool <- new Bool;
  someTruth7 : Bool <- true;
  otherTruth7 : Bool <- false;
  someTruth8 : Bool <- new Bool;
  otherTruth8 : Bool <- true;
  someTruth9 : Bool <- false;
  otherTruth9 : Bool <- new Bool;
  someTruth10 : Bool <- true;
  otherTruth10 : Bool <- false;
  someTruth11 : Bool <- new Bool;
  otherTruth11 : Bool <- new Bool;
  someTruth12 : Bool <- true;
  otherTruth12 : Bool <- false;
  someTruth13 : Bool <- new Bool;
  otherTruth13 : Bool <- new Bool;
  someTruth14 : Bool <- true;
  otherTruth14 : Bool <- false;
  someTruth15 : Bool <- new Bool;
  otherTruth15 : Bool <- new Bool;
  someTruth16 : Bool <- true;
  otherTruth16 : Bool <- false;
  someTruth17 : Bool <- new Bool;
  otherTruth17 : Bool <- new Bool;
  someTruth18 : Bool <- true;
  otherTruth18 : Bool <- false;
  someTruth19 : Bool <- new Bool;
  otherTruth19 : Bool <- new Bool;
  someTruth20 : Bool <- true;
  otherTruth20 : Bool <- false;
  
  
  someTruth21 : Bool <- true;
  otherTruth21 : Bool <- false;
  someTruth22 : Bool <- new Bool;
  otherTruth22 : Bool <- new Bool;
  someTruth23 : Bool <- true;
  otherTruth23 : Bool <- false;
  someTruth24 : Bool <- new Bool;
  otherTruth24 : Bool <- new Bool;
  someTruth25 : Bool <- true;
  otherTruth25 : Bool <- false;
  someTruth26 : Bool <- new Bool;
  otherTruth26 : Bool <- new Bool;
  someTruth27 : Bool <- true;
  otherTruth27 : Bool <- false;
  someTruth28 : Bool <- new Bool;
  otherTruth28 : Bool <- new Bool;
  someTruth29 : Bool <- true;
  otherTruth29 : Bool <- false;
  someTruth30 : Bool <- new Bool;
  otherTruth30 : Bool <- new Bool;
  someTruth31 : Bool <- true;
  otherTruth31 : Bool <- false;
  someTruth32 : Bool <- new Bool;
  otherTruth32 : Bool <- new Bool;
  someTruth33 : Bool <- true;
  otherTruth33 : Bool <- false;
  someTruth34 : Bool <- new Bool;
  otherTruth34 : Bool <- new Bool;
  someTruth35 : Bool <- true;
  otherTruth35 : Bool <- false;
  someTruth36 : Bool <- new Bool;
  otherTruth36 : Bool <- new Bool;
  someTruth37 : Bool <- true;
  otherTruth37 : Bool <- false;
  someTruth38 : Bool <- new Bool;
  otherTruth38 : Bool <- new Bool;
  someTruth39 : Bool <- true;
  otherTruth39 : Bool <- false;
  someTruth40 : Bool <- new Bool;
  otherTruth40 : Bool <- new Bool;
  
  
  f( a : Int, b : Int, c : Int) : Int {
    a + b + c
  };

	main(): Object {{

		out_string("Hello World!!!!!!!!!!!!!");
		while someIndex < 1000000000 loop
		{
		b1 <- 1 + f(someIndex, someIndex, someIndex);
		c1 <- new Int;
		d1 <- 1 + f(someIndex, someIndex, someIndex);
		e1 <- new Int;
		f1 <- 1 + f(someIndex, someIndex, someIndex);
		g1 <- new Int;
		h1 <- 1 + f(someIndex, someIndex, someIndex);
		i1 <- new Int;
		j1 <- 1 + f(someIndex, someIndex, someIndex);
		k1 <- new Int;
		l1  <- 1 + f(someIndex, someIndex, someIndex);
		m1  <- 1 + f(someIndex, someIndex, someIndex);
		n1 <- 1 + f(someIndex, someIndex, someIndex);
		o1 <- 1 + f(someIndex, someIndex, someIndex);
		p1 <- 1 + f(someIndex, someIndex, someIndex);
		q1 <- 1 + f(someIndex, someIndex, someIndex);
		r1 <- 2 + f(someIndex, someIndex, someIndex);
		s1 <- 2 + f(someIndex, someIndex, someIndex);
		t1 <- 2 + f(someIndex, someIndex, someIndex);
		u1 <- 2 + f(someIndex, someIndex, someIndex);
		v1 <- 2 + f(someIndex, someIndex, someIndex);
		w1 <- 2 + f(someIndex, someIndex, someIndex);
		
		b2 <- 41 + f(someIndex, someIndex, someIndex);
		c2 <- new Int;
		d2 <- 61 + f(someIndex, someIndex, someIndex);
		e2 <- new Int;
		f2 <- 81 + f(someIndex, someIndex, someIndex);
		g2 <- new Int;
		h2 <- 101 + f(someIndex, someIndex, someIndex);
		i2  <- new Int;
		j2  <- 121 + f(someIndex, someIndex, someIndex);
		k2  <- new Int;
		l2  <- 141 + f(someIndex, someIndex, someIndex);
		m2  <- 151 + f(someIndex, someIndex, someIndex);
		n2  <- 161 + f(someIndex, someIndex, someIndex);
		o2  <- 171 + f(someIndex, someIndex, someIndex);
		p2  <- 181 + f(someIndex, someIndex, someIndex);
		q2  <- 191 + f(someIndex, someIndex, someIndex);
		r2  <- 201 + f(someIndex, someIndex, someIndex);
		s2  <- 211 + f(someIndex, someIndex, someIndex);
		t2  <- 221 + f(someIndex, someIndex, someIndex);
		u2  <- 231 + f(someIndex, someIndex, someIndex);
		v2  <- 241 + f(someIndex, someIndex, someIndex);
		w2  <- 251 + f(someIndex, someIndex, someIndex);
		
		b3  <- 41 + f(someIndex, someIndex, someIndex);
		c3  <- new Int;
		d3  <- 61 + f(someIndex, someIndex, someIndex);
		e3  <- new Int;
		f3  <- 81 + f(someIndex, someIndex, someIndex);
		g3  <- new Int;
		h3  <- 101 + f(someIndex, someIndex, someIndex);
		i3  <- new Int;
		j3  <- 121 + f(someIndex, someIndex, someIndex);
		k3  <- new Int;
		l3  <- 141 + f(someIndex, someIndex, someIndex);
		m3  <- 151 + f(someIndex, someIndex, someIndex);
		n3  <- 161 + f(someIndex, someIndex, someIndex);
		o3  <- 171 + f(someIndex, someIndex, someIndex);
		p3  <- 181 + f(someIndex, someIndex, someIndex);
		q3  <- 191 + f(someIndex, someIndex, someIndex);
		r3  <- 201 + f(someIndex, someIndex, someIndex);
		s3  <- 211 + f(someIndex, someIndex, someIndex);
		t3  <- 221 + f(someIndex, someIndex, someIndex);
		u3  <- 231 + f(someIndex, someIndex, someIndex);
		v3  <- 241 + f(someIndex, someIndex, someIndex);
		w3  <- 251 + f(someIndex, someIndex, someIndex);
		
		
		b4 <- 41 + f(someIndex, someIndex, someIndex);
		c4 <- new Int;
		d4 <- 61 + f(someIndex, someIndex, someIndex);
		e4 <- new Int;
		f4 <- 81 + f(someIndex, someIndex, someIndex);
		g4 <- new Int;
		h4 <- 101 + f(someIndex, someIndex, someIndex);
		i4  <- new Int;
		j4 <- 112 + f(someIndex, someIndex, someIndex);
		k4 <- new Int;
		l4 <- 141 + f(someIndex, someIndex, someIndex);
		m4 <- 151 + f(someIndex, someIndex, someIndex);
		n4 <- 161 + f(someIndex, someIndex, someIndex);
		o4 <- 171 + f(someIndex, someIndex, someIndex);
		p4 <- 181 + f(someIndex, someIndex, someIndex);
		q4 <- 191 + f(someIndex, someIndex, someIndex);
		r4 <- 201 + f(someIndex, someIndex, someIndex);
		s4 <- 211 + f(someIndex, someIndex, someIndex);
		t4 <- 221 + f(someIndex, someIndex, someIndex);
		u4 <- 231 + f(someIndex, someIndex, someIndex);
		v4  <- 241 + f(someIndex, someIndex, someIndex);
		w4 <- 251 + f(someIndex, someIndex, someIndex);
		
		b5 <- 41 + f(someIndex, someIndex, someIndex);
		c5 <- new Int;
		d5 <- 61 + f(someIndex, someIndex, someIndex);
		e5 <- new Int;
		f5 <- 81 + f(someIndex, someIndex, someIndex);
		g5 <- new Int;
		h5 <- 101 + f(someIndex, someIndex, someIndex);
		i5 <- new Int;
		j5 <- 121 + f(someIndex, someIndex, someIndex);
		k5 <- new Int;
		l5 <- 141 + f(someIndex, someIndex, someIndex);
		m5 <- 151 + f(someIndex, someIndex, someIndex);
		n5 <- 161 + f(someIndex, someIndex, someIndex);
		o5 <- 171 + f(someIndex, someIndex, someIndex);
		p5 <- 181 + f(someIndex, someIndex, someIndex);
		q5 <- 191 + f(someIndex, someIndex, someIndex);
		r5 <- 201 + f(someIndex, someIndex, someIndex);
		s5 <- 211 + f(someIndex, someIndex, someIndex);
		t5 <- 221 + f(someIndex, someIndex, someIndex);
		u5 <- 231 + f(someIndex, someIndex, someIndex);
		v5 <- 241 + f(someIndex, someIndex, someIndex);
		w5 <- 251 + f(someIndex, someIndex, someIndex);

	someIndex <- (someIndex  + 1) / 1000000000;
	x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) +5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)  + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) - 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) - 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) -  5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) - 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)  + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)  - 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)  + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex) + f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex)+ f(someIndex, someIndex, someIndex);

	}pool;

	someIndex <- 0;
	while someIndex < 1000000000 loop
	{
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();

		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
		someIndex <- (someIndex + 1) / 1000000000;
		testA.copy();
		testC.copy();
		testE.copy();
		testG.copy();
		testI.copy();
		testK.copy();
		testM.copy();
		testO.copy();
		testQ.copy();
		testT.copy();
		testV.copy();
		testX.copy();

		testA.type_name();
		testC.type_name();
		testE.type_name();
		testG.type_name();
		testI.type_name();
		testK.type_name();
		testM.type_name();
		testO.type_name();
		testQ.type_name();
		testT.type_name();
		testV.type_name();
		testX.type_name();
	} pool; 


	
	}};
};
class TestA inherits IO {};
class TestB inherits TestA {};
class TestC inherits TestB {};
class TestD inherits TestC {};
class TestE inherits TestD {};
class TestF inherits TestE {};
class TestG inherits TestF {};
class TestH inherits TestG {};
class TestI inherits TestH {};
class TestJ inherits TestI {};
class TestK inherits TestJ {};
class TestL inherits TestK {};
class TestM inherits TestL {};
class TestN inherits TestM {};
class TestO inherits TestN {};
class TestP inherits TestO {};
class TestQ inherits TestP {};
class TestR inherits TestQ {};
class TestS inherits TestR {};
class TestT inherits TestS {};
class TestU inherits TestT {};
class TestV inherits TestU {};
class TestW inherits TestV {};
class TestX inherits TestW {};
class TestY inherits TestX {};

class FromIO1 inherits IO {


	copy() : SELF_TYPE {self};
};
class FromIO2 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO3 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO4 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO5 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO6 inherits IO 
{copy() : SELF_TYPE {self};};
class FromIO7 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO8 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO9 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO10 inherits IO {copy() : SELF_TYPE {self};};
class FromIO11 inherits IO {};
class FromIO12 inherits IO {};
class FromIO13 inherits IO {};
class FromIO14 inherits IO {};
class FromIO15 inherits IO {};
class FromIO16 inherits IO {};
class FromIO17 inherits IO {};
class FromIO18 inherits IO {};
class FromIO19 inherits IO {};
class FromIO20 inherits IO {};
class FromIO21 inherits IO {};
class FromIO22 inherits IO {};
class FromIO23 inherits IO {};
class FromIO24 inherits IO {};
class FromIO25 inherits IO {};
class FromIO26 inherits IO {};
class FromIO27 inherits IO {};
class FromIO28 inherits IO {};
class FromIO29 inherits IO {};
class FromIO30 inherits IO {};
class FromIO31 inherits IO {};
class FromIO32 inherits IO {};
class FromIO33 inherits IO {};
class FromIO34 inherits IO {};
class FromIO35 inherits IO {};
class FromIO36 inherits IO {};
class FromIO37 inherits IO {};
class FromIO38 inherits IO {};
class FromIO39 inherits IO {};
class FromIO40 inherits IO {};
class FromIO41 inherits IO {};
class FromIO42 inherits IO {};
class FromIO43 inherits IO {};
class FromIO44 inherits IO {};
class FromIO45 inherits IO {};
class FromIO46 inherits IO {};
class FromIO47 inherits IO {};
class FromIO48 inherits IO {};
class FromIO49 inherits IO {};
class FromIO50 inherits IO {};
class FromIO51 inherits IO {};
class FromIO52 inherits IO {};
class FromIO53 inherits IO {};
class FromIO54 inherits IO {};
class FromIO55 inherits IO {};
class FromIO56 inherits IO {};
class FromIO57 inherits IO {};
class FromIO58 inherits IO {};
class FromIO59 inherits IO {};
class FromIO60 inherits IO {};
class FromIO61 inherits IO {};
class FromIO62 inherits IO {};
class FromIO63 inherits IO {};
class FromIO64 inherits IO {};
class FromIO65 inherits IO {};
class FromIO66 inherits IO {};
class FromIO67 inherits IO {};
class FromIO68 inherits IO {};
class FromIO69 inherits IO {};
class FromIO70 inherits IO {};
class FromIO71 inherits IO {};
class FromIO72 inherits IO {};
class FromIO73 inherits IO {};
class FromIO74 inherits IO {};
class FromIO75 inherits IO {};
class FromIO76 inherits IO {};
class FromIO77 inherits IO {};
class FromIO78 inherits IO {};
class FromIO79 inherits IO {};
class FromIO80 inherits IO {};
class FromIO81 inherits IO {};
class FromIO82 inherits IO {};
class FromIO83 inherits IO {};
class FromIO84 inherits IO {};
