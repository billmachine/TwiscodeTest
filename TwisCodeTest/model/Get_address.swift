/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Get_address : Codable {
	let id : String?
	let bs_items_id : String?
	let province_id : String?
	let province : String?
	let city_id : String?
	let city : String?
	let district_id : String?
	let district : String?
	let zip_code : String?
	let longitude : String?
	let latitude : String?
	let full_address : String?
	let contact_person : String?
	let name_address : String?
	let created_at : String?
	let updated_at : String?
	let deleted_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case bs_items_id = "bs_items_id"
		case province_id = "province_id"
		case province = "province"
		case city_id = "city_id"
		case city = "city"
		case district_id = "district_id"
		case district = "district"
		case zip_code = "zip_code"
		case longitude = "longitude"
		case latitude = "latitude"
		case full_address = "full_address"
		case contact_person = "contact_person"
		case name_address = "name_address"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		bs_items_id = try values.decodeIfPresent(String.self, forKey: .bs_items_id)
		province_id = try values.decodeIfPresent(String.self, forKey: .province_id)
		province = try values.decodeIfPresent(String.self, forKey: .province)
		city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		district_id = try values.decodeIfPresent(String.self, forKey: .district_id)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
		contact_person = try values.decodeIfPresent(String.self, forKey: .contact_person)
		name_address = try values.decodeIfPresent(String.self, forKey: .name_address)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
	}

}