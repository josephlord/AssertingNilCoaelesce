//
//  AssertingNilCoaelesce.swift
//  Giftstar
//
//  Created by Joseph on 02/12/2014.
//  Copyright (c) 2014 Human Friendly Ltd. All rights reserved.
//

infix operator !! { associativity right precedence 110 }
public func !!<A>(lhs:A?, rhs:@autoclosure()->A)->A {
    assert(lhs != nil)
    return lhs ?? rhs()
}
