/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Category : Codable {
	let cat_id : String?
	let cat_name : String?
	let cat_ordering : String?
	let status : String?
	let added_date : String?
	let default_photo : Default_photo?
	let default_icon : Default_icon?

	enum CodingKeys: String, CodingKey {

		case cat_id = "cat_id"
		case cat_name = "cat_name"
		case cat_ordering = "cat_ordering"
		case status = "status"
		case added_date = "added_date"
		case default_photo = "default_photo"
		case default_icon = "default_icon"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
		cat_name = try values.decodeIfPresent(String.self, forKey: .cat_name)
		cat_ordering = try values.decodeIfPresent(String.self, forKey: .cat_ordering)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		added_date = try values.decodeIfPresent(String.self, forKey: .added_date)
		default_photo = try values.decodeIfPresent(Default_photo.self, forKey: .default_photo)
		default_icon = try values.decodeIfPresent(Default_icon.self, forKey: .default_icon)
	}

}