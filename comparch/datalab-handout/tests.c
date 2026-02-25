/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

/* Copyright (C) 1991-2021 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters */
/* bit manipulation */
int test_func1(int x) {
  return x == 0;
}
int test_func2(int x, int y)
{
  return ~(x|y);
}
int test_func3(int x, int y)
{
  return x&~y;
}
int test_func4(int x) {
  int i = 0;
  int results = 0;
  for (i = 0; i < 32; i++) {
    int ith_bit = ( (x >> i) & 0x1 );
    if (i < 16) {
      ith_bit = ith_bit << (i + 16);
    } else {
      ith_bit = ith_bit << (i - 16);
    }
    results = results | ith_bit;
  }
  return results;
}
int test_func5(int x)
{
  return (x & 0x1) ? -1 : 0;
}
int test_func6(int x) {
  int i;
  for (i = 0; i < 32; i+=2)
      if ((x & (1<<i)) == 0)
   return 0;
  return 1;
}
int test_func7(int x, int n) {
  unsigned u = (unsigned) x;
  unsigned shifted = u >> n;
  return (int) shifted;
}
/* 2's complement */
int test_func8(void) {
  return 0x80000000;
}
int test_func9(int x) {
    return x == 0x7FFFFFFF;
}
int test_func10(int x) {
  return -x;
}
int test_func11(int x, int y)
{
    long long lsum = (long long) x + y;
    return lsum == (int) lsum;
}
int test_func12(int x, int y)
{
  return x > y;
}
int test_func13(int x, int y)
{
  int lt = ( (signed) ((unsigned) x + (unsigned) y) < 0);
  if (x > 0 && y > 0 && lt) {
    return (0x7FFFFFFF);
  }
  if (x < 0 && y < 0 && !lt)
    return (0x80000000);
  return x + y;
}
