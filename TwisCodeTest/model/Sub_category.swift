/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Sub_category : Codable {
	let id : String?
	let cat_id : String?
	let name : String?
	let status : String?
	let added_date : String?
	let added_user_id : String?
	let updated_date : String?
	let updated_user_id : String?
	let updated_flag : String?
	let default_photo : Default_photo?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case cat_id = "cat_id"
		case name = "name"
		case status = "status"
		case added_date = "added_date"
		case added_user_id = "added_user_id"
		case updated_date = "updated_date"
		case updated_user_id = "updated_user_id"
		case updated_flag = "updated_flag"
		case default_photo = "default_photo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		added_date = try values.decodeIfPresent(String.self, forKey: .added_date)
		added_user_id = try values.decodeIfPresent(String.self, forKey: .added_user_id)
		updated_date = try values.decodeIfPresent(String.self, forKey: .updated_date)
		updated_user_id = try values.decodeIfPresent(String.self, forKey: .updated_user_id)
		updated_flag = try values.decodeIfPresent(String.self, forKey: .updated_flag)
		default_photo = try values.decodeIfPresent(Default_photo.self, forKey: .default_photo)
	}

}