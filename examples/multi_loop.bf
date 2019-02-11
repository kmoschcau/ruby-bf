++++++++++    r0 = 10
[             loop 1
  >++++++++++ r1 add 10
  [           loop 2
    >+        r2 add 1
    <-        r1 sub 1
  ]           loop 2 end when r1 = 0 (ran 10 times)
  <-          r0 sub 1
]             loop 1 end when r0 = 0 (ran 10 times)
>>---         r2 sub 3
.             print r2 (should be 97 ("a"))
