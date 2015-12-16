//
//  FromJSONMap.swift
//  Cingulata
//
//  Created by Alexander Evsyuchenya on 12/16/15.
//  Copyright © 2015 baydet. All rights reserved.
//

import Foundation

public protocol nMap {
	subscript(key: String) -> Self { get }
	
	func <- <T>(inout left: T, right: Self)
	func <- <T>(inout left: T?, right: Self)
	func <- <T>(inout left: T!, right: Self)
}

public protocol mutableMap: nMap {
	subscript(key: String) -> Map { get set }
}

public struct FromJSONMap: nMap {
	public subscript(key: String) -> FromJSONMap {
		//		// save key and value associated to it
		//		currentKey = key
		//		keyIsNested = nested
		//
		//		// check if a value exists for the current key
		//		if nested == false {
		//			currentValue = JSONDictionary[key]
		//		} else {
		//			// break down the components of the key that are separated by .
		//			currentValue = valueFor(ArraySlice(key.componentsSeparatedByString(".")), dictionary: JSONDictionary)
		//		}
		
		return self
	}
}

public func <- <T>(inout left: T, right: FromJSONMap) {
	
}

public func <- <T>(inout left: T?, right: FromJSONMap) {
	
}

public func <- <T>(inout left: T!, right: FromJSONMap) {
	
}

public protocol nMappable {
	init?<T: nMap>(_ map: T)
	mutating func mapping<T: nMap>(map: T)
}

struct Test: nMappable {
	var a: String = ""
	init?<T: nMap>(_ map: T) {
		
	}
	
	mutating func mapping<T: nMap>(map: T) {
		var a: Int?
		a <- map["test"]
	}
}

func testMapping1<T: nMap>(inout test: Test, map: T) {
	test.a <- map["test"]
}

func testMapping(inout test: Test, map: FromJSONMap) -> Void {
	testMapping1(&test, map: map)
}

//let a = ResponseMapper<Test, FromJSONMap>(mapFunction: testMapping1)

public final class ResponseMapper<N: nMappable, T: nMap>: Mapping<N, T> {

	public func map(JSON: [String : AnyObject]) -> N? {
		return nil
	}
	
	public func mapArray(JSONrray: [[String : AnyObject]]) -> [N?] {
		return []
	}
	
//		let map = FromJSONMap()
//		guard var object = N(map) else {
//			return nil
//		}
//		object.mapping(map)
//		return nil
//	}
	
//	public func map(JSON: [String : AnyObject], toObject object: N) -> N {
//		
//		return object
//	}
	
//	required public init<Map: nMap, MutableMap: mutableMap>(fromJSONMap: Map, toJSONMap: MutableMap) {
//		
//	}
}

public final class RequestMapping<N: nMappable, T: nMap>: Mapping<N, T> {
	public func map(JSON: [String : AnyObject]) -> N? {
		return nil
	}
	
	public func mapArray(JSONrray: [[String : AnyObject]]) -> [N?] {
		return []
	}

}

public class Mapping<N: nMappable, T: nMap> {
	public typealias MappingFunction = (inout N, T) -> Void
	let mapFunction: MappingFunction
	
	required public init(mapFunction:  MappingFunction) {
		self.mapFunction = mapFunction
		//			{ (inout test: Test, json: FromJSONMap) -> Void in
		//
		//		}
	}

}