/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Item_currency : Codable {
	let id : String?
	let currency_short_form : String?
	let currency_symbol : String?
	let status : String?
	let added_date : String?
	let is_empty_object : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case currency_short_form = "currency_short_form"
		case currency_symbol = "currency_symbol"
		case status = "status"
		case added_date = "added_date"
		case is_empty_object = "is_empty_object"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		currency_short_form = try values.decodeIfPresent(String.self, forKey: .currency_short_form)
		currency_symbol = try values.decodeIfPresent(String.self, forKey: .currency_symbol)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		added_date = try values.decodeIfPresent(String.self, forKey: .added_date)
		is_empty_object = try values.decodeIfPresent(String.self, forKey: .is_empty_object)
	}

}