// Copyright (c) 2015 Electronic Theatre Controls, http://www.etcconnect.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/*deftypes.h
  This is the list of standard types used in common code.
  Except for uint, they represent types that are always the same size,
    no matter what platform they are on.
  
  Note that int is also a standard type that is acceptable (although
    not always the same size)

  This version wraps the Qt standard types, so is platform neutral
*/
#ifndef _DEFTYPES_H_
#define _DEFTYPES_H_

#include <QtGlobal>

typedef unsigned int		uint;		//An arbitrary unsigned integer
typedef qint8				int1;		//An integer 1 byte long
typedef quint8      		uint1;		//An unsigned integer 1 byte long
typedef qint16				int2;		//An integer 2 bytes long
typedef quint16     		uint2;		//An unsigned integer 2 bytes long
typedef qint32				int4;		//An integer 4 bytes long
typedef quint32     		uint4;		//An unsigned integer 4 bytes long
typedef qint64              int8;		//An integer 8 bytes long
typedef quint64         	uint8;		//An unsigned integer 8 bytes long

#endif  /*_DEFTYPES_H_*/
