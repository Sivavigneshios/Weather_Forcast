

internal final class FromJSON {
	
	/// Basic type
	class func basicType<FieldType>(_ field: inout FieldType, object: FieldType?) {
		if let value = object {
			field = value
		}
	}
	
	/// optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType?, object: FieldType?) {
		field = object
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType!, object: FieldType?) {
		field = object
	}
	#endif
	
	/// Mappable object
	class func object<N: BaseMappable>(_ field: inout N, map: Map) {
		if map.toObject {
			field = Mapper(context: map.context).map(JSONObject: map.currentValue, toObject: field)
		} else if let value: N = Mapper(context: map.context).map(JSONObject: map.currentValue) {
			field = value
		}
	}
	
	/// Optional Mappable Object

	class func optionalObject<N: BaseMappable>(_ field: inout N?, map: Map) {
		if let f = field , map.toObject && map.currentValue != nil {
			 field = Mapper(context: map.context).map(JSONObject: map.currentValue, toObject: f)
		} else {
			field = Mapper(context: map.context).map(JSONObject: map.currentValue)
		}
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped Optional Mappable Object
	class func optionalObject<N: BaseMappable>(_ field: inout N!, map: Map) {
		if let f = field , map.toObject && map.currentValue != nil {
			field = Mapper(context: map.context).map(JSONObject: map.currentValue, toObject: f)
		} else {
			field = Mapper(context: map.context).map(JSONObject: map.currentValue)
		}
	}
	#endif
	
	/// mappable object array
	class func objectArray<N: BaseMappable>(_ field: inout Array<N>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapArray(JSONObject: map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable object array

	class func optionalObjectArray<N: BaseMappable>(_ field: inout Array<N>?, map: Map) {
		if let objects: Array<N> = Mapper(context: map.context).mapArray(JSONObject: map.currentValue) {
			field = objects
		} else {
			field = nil
		}
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped optional mappable object array
	class func optionalObjectArray<N: BaseMappable>(_ field: inout Array<N>!, map: Map) {
		if let objects: Array<N> = Mapper(context: map.context).mapArray(JSONObject: map.currentValue) {
			field = objects
		} else {
			field = nil
		}
	}
	#endif
	
	/// mappable object array
	class func twoDimensionalObjectArray<N: BaseMappable>(_ field: inout Array<Array<N>>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable 2 dimentional object array
	class func optionalTwoDimensionalObjectArray<N: BaseMappable>(_ field: inout Array<Array<N>>?, map: Map) {
		field = Mapper(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue)
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped optional 2 dimentional mappable object array
	class func optionalTwoDimensionalObjectArray<N: BaseMappable>(_ field: inout Array<Array<N>>!, map: Map) {
		field = Mapper(context: map.context).mapArrayOfArrays(JSONObject: map.currentValue)
	}
	#endif
	
	/// Dctionary containing Mappable objects
	class func objectDictionary<N: BaseMappable>(_ field: inout Dictionary<String, N>, map: Map) {
		if map.toObject {
			field = Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: field)
		} else {
			if let objects = Mapper<N>(context: map.context).mapDictionary(JSONObject: map.currentValue) {
				field = objects
			}
		}
	}
	
	/// Optional dictionary containing Mappable objects
	class func optionalObjectDictionary<N: BaseMappable>(_ field: inout Dictionary<String, N>?, map: Map) {
		if let f = field , map.toObject && map.currentValue != nil {
			field = Mapper(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: f)
		} else {
			field = Mapper(context: map.context).mapDictionary(JSONObject: map.currentValue)
		}
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped Dictionary containing Mappable objects
	class func optionalObjectDictionary<N: BaseMappable>(_ field: inout Dictionary<String, N>!, map: Map) {
		if let f = field , map.toObject && map.currentValue != nil {
			field = Mapper(context: map.context).mapDictionary(JSONObject: map.currentValue, toDictionary: f)
		} else {
			field = Mapper(context: map.context).mapDictionary(JSONObject: map.currentValue)
		}
	}
	#endif
	
	/// Dictionary containing Array of Mappable objects
	class func objectDictionaryOfArrays<N: BaseMappable>(_ field: inout Dictionary<String, [N]>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue) {
			field = objects
		}
	}
	
	/// Optional Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: BaseMappable>(_ field: inout Dictionary<String, [N]>?, map: Map) {
		field = Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue)
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: BaseMappable>(_ field: inout Dictionary<String, [N]>!, map: Map) {
		field = Mapper<N>(context: map.context).mapDictionaryOfArrays(JSONObject: map.currentValue)
	}
	#endif
	
	/// mappable object Set
	class func objectSet<N: BaseMappable>(_ field: inout Set<N>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapSet(JSONObject: map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable object array
	class func optionalObjectSet<N: BaseMappable>(_ field: inout Set<N>?, map: Map) {
		field = Mapper(context: map.context).mapSet(JSONObject: map.currentValue)
	}
	
	// Code targeting the Swift 4.1 compiler and below.
	#if !(swift(>=4.1.50) || (swift(>=3.4) && !swift(>=4.0)))
	/// Implicitly unwrapped optional mappable object array
	class func optionalObjectSet<N: BaseMappable>(_ field: inout Set<N>!, map: Map) {
		field = Mapper(context: map.context).mapSet(JSONObject: map.currentValue)
	}
	#endif
}
