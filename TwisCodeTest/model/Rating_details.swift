/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Rating_details : Codable {
	let five_star_count : String?
	let five_star_percent : String?
	let four_star_count : String?
	let four_star_percent : String?
	let three_star_count : String?
	let three_star_percent : String?
	let two_star_count : String?
	let two_star_percent : String?
	let one_star_count : String?
	let one_star_percent : String?
	let total_rating_count : String?
	let total_rating_value : String?

	enum CodingKeys: String, CodingKey {

		case five_star_count = "five_star_count"
		case five_star_percent = "five_star_percent"
		case four_star_count = "four_star_count"
		case four_star_percent = "four_star_percent"
		case three_star_count = "three_star_count"
		case three_star_percent = "three_star_percent"
		case two_star_count = "two_star_count"
		case two_star_percent = "two_star_percent"
		case one_star_count = "one_star_count"
		case one_star_percent = "one_star_percent"
		case total_rating_count = "total_rating_count"
		case total_rating_value = "total_rating_value"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		five_star_count = try values.decodeIfPresent(String.self, forKey: .five_star_count)
		five_star_percent = try values.decodeIfPresent(String.self, forKey: .five_star_percent)
		four_star_count = try values.decodeIfPresent(String.self, forKey: .four_star_count)
		four_star_percent = try values.decodeIfPresent(String.self, forKey: .four_star_percent)
		three_star_count = try values.decodeIfPresent(String.self, forKey: .three_star_count)
		three_star_percent = try values.decodeIfPresent(String.self, forKey: .three_star_percent)
		two_star_count = try values.decodeIfPresent(String.self, forKey: .two_star_count)
		two_star_percent = try values.decodeIfPresent(String.self, forKey: .two_star_percent)
		one_star_count = try values.decodeIfPresent(String.self, forKey: .one_star_count)
		one_star_percent = try values.decodeIfPresent(String.self, forKey: .one_star_percent)
		total_rating_count = try values.decodeIfPresent(String.self, forKey: .total_rating_count)
		total_rating_value = try values.decodeIfPresent(String.self, forKey: .total_rating_value)
	}

}