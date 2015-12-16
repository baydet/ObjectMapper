//
//  FromJSONMap.swift
//  ObjectMapper
//
//  Created by Alexander Evsyuchenya on 12/16/15.
//  Copyright © 2015 hearst. All rights reserved.
//

import Foundation

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
	init?<T: nMap>(_ map: T) {
		
	}
	
	mutating func mapping<T: nMap>(map: T) {
		var a: Int?
		a <- map["test"]
	}
}

public final class nJSONMapper<N : nMappable> {
//	let fromJSONMap = FromJSONMap()

	public func map(JSON: [String : AnyObject]) -> N? {
		let map = FromJSONMap()
		guard var object = N(map) else {
			return nil
		}
		object.mapping(map)
		return nil
	}
	
	public func map(JSON: [String : AnyObject], toObject object: N) -> N {
		
		return object
	}
	
//	required public init<Map: nMap, MutableMap: mutableMap>(fromJSONMap: Map, toJSONMap: MutableMap) {
//		
//	}
}