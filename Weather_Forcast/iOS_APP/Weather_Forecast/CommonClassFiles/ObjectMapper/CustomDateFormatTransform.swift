

import Foundation

open class CustomDateFormatTransform: DateFormatterTransform {
	
    public init(formatString: String) {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = formatString
		
		super.init(dateFormatter: formatter)
    }
}
