

import Foundation

/// Transforms JSON dictionary to Codable type T and back
open class CodableTransform<T: Codable>: TransformType {

    public typealias Object = T
    public typealias JSON = Any

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Object? {
				var _data: Data? = nil
				switch value {
				case let dict as [String : Any]:
					_data = try? JSONSerialization.data(withJSONObject: dict, options: [])
				case let array as [[String : Any]]:
					_data = try? JSONSerialization.data(withJSONObject: array, options: [])
				default:
					_data = nil
				}
				guard let data = _data else { return nil }
				
        do {
            let decoder = JSONDecoder()
            let item = try decoder.decode(T.self, from: data)
            return item
        } catch {
            return nil
        }
    }

    open func transformToJSON(_ value: T?) -> JSON? {
        guard let item = value else {
            return nil
        }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(item)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return dictionary
        } catch {
            return nil
        }
    }
}
