//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// WARNING: This test was generated by generate_feature_test_macro_components.py
// and should not be edited manually.
//
// clang-format off

// <compare>

// Test the feature test macros defined by <compare>

/*  Constant                          Value
    __cpp_lib_three_way_comparison    201711L [C++20]
*/

#include <compare>
#include "test_macros.h"

#if TEST_STD_VER < 14

# ifdef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should not be defined before c++20"
# endif

#elif TEST_STD_VER == 14

# ifdef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should not be defined before c++20"
# endif

#elif TEST_STD_VER == 17

# ifdef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should not be defined before c++20"
# endif

#elif TEST_STD_VER == 20

# ifndef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should be defined in c++20"
# endif
# if __cpp_lib_three_way_comparison != 201711L
#   error "__cpp_lib_three_way_comparison should have the value 201711L in c++20"
# endif

#elif TEST_STD_VER == 23

# ifndef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should be defined in c++23"
# endif
# if __cpp_lib_three_way_comparison != 201711L
#   error "__cpp_lib_three_way_comparison should have the value 201711L in c++23"
# endif

#elif TEST_STD_VER > 23

# ifndef __cpp_lib_three_way_comparison
#   error "__cpp_lib_three_way_comparison should be defined in c++26"
# endif
# if __cpp_lib_three_way_comparison != 201711L
#   error "__cpp_lib_three_way_comparison should have the value 201711L in c++26"
# endif

#endif // TEST_STD_VER > 23
