/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct User : Codable {
	let user_id : String?
	let user_is_sys_admin : String?
	let facebook_id : String?
	let google_id : String?
	let phone_id : String?
	let apple_id : String?
	let user_name : String?
	let user_email : String?
	let user_phone : String?
	let user_address : String?
	let city : String?
	let user_about_me : String?
	let user_cover_photo : String?
	let user_profile_photo : String?
	let role_id : String?
	let status : String?
	let is_banned : String?
	let added_date : String?
	let device_token : String?
	let code : String?
	let overall_rating : String?
	let whatsapp : String?
	let messenger : String?
	let follower_count : String?
	let following_count : String?
	let email_verify : String?
	let facebook_verify : String?
	let google_verify : String?
	let phone_verify : String?
	let apple_verify : String?
	let rating_count : String?
	let is_followed : String?
	let rating_details : Rating_details?

	enum CodingKeys: String, CodingKey {

		case user_id = "user_id"
		case user_is_sys_admin = "user_is_sys_admin"
		case facebook_id = "facebook_id"
		case google_id = "google_id"
		case phone_id = "phone_id"
		case apple_id = "apple_id"
		case user_name = "user_name"
		case user_email = "user_email"
		case user_phone = "user_phone"
		case user_address = "user_address"
		case city = "city"
		case user_about_me = "user_about_me"
		case user_cover_photo = "user_cover_photo"
		case user_profile_photo = "user_profile_photo"
		case role_id = "role_id"
		case status = "status"
		case is_banned = "is_banned"
		case added_date = "added_date"
		case device_token = "device_token"
		case code = "code"
		case overall_rating = "overall_rating"
		case whatsapp = "whatsapp"
		case messenger = "messenger"
		case follower_count = "follower_count"
		case following_count = "following_count"
		case email_verify = "email_verify"
		case facebook_verify = "facebook_verify"
		case google_verify = "google_verify"
		case phone_verify = "phone_verify"
		case apple_verify = "apple_verify"
		case rating_count = "rating_count"
		case is_followed = "is_followed"
		case rating_details = "rating_details"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
		user_is_sys_admin = try values.decodeIfPresent(String.self, forKey: .user_is_sys_admin)
		facebook_id = try values.decodeIfPresent(String.self, forKey: .facebook_id)
		google_id = try values.decodeIfPresent(String.self, forKey: .google_id)
		phone_id = try values.decodeIfPresent(String.self, forKey: .phone_id)
		apple_id = try values.decodeIfPresent(String.self, forKey: .apple_id)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		user_email = try values.decodeIfPresent(String.self, forKey: .user_email)
		user_phone = try values.decodeIfPresent(String.self, forKey: .user_phone)
		user_address = try values.decodeIfPresent(String.self, forKey: .user_address)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		user_about_me = try values.decodeIfPresent(String.self, forKey: .user_about_me)
		user_cover_photo = try values.decodeIfPresent(String.self, forKey: .user_cover_photo)
		user_profile_photo = try values.decodeIfPresent(String.self, forKey: .user_profile_photo)
		role_id = try values.decodeIfPresent(String.self, forKey: .role_id)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		is_banned = try values.decodeIfPresent(String.self, forKey: .is_banned)
		added_date = try values.decodeIfPresent(String.self, forKey: .added_date)
		device_token = try values.decodeIfPresent(String.self, forKey: .device_token)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		overall_rating = try values.decodeIfPresent(String.self, forKey: .overall_rating)
		whatsapp = try values.decodeIfPresent(String.self, forKey: .whatsapp)
		messenger = try values.decodeIfPresent(String.self, forKey: .messenger)
		follower_count = try values.decodeIfPresent(String.self, forKey: .follower_count)
		following_count = try values.decodeIfPresent(String.self, forKey: .following_count)
		email_verify = try values.decodeIfPresent(String.self, forKey: .email_verify)
		facebook_verify = try values.decodeIfPresent(String.self, forKey: .facebook_verify)
		google_verify = try values.decodeIfPresent(String.self, forKey: .google_verify)
		phone_verify = try values.decodeIfPresent(String.self, forKey: .phone_verify)
		apple_verify = try values.decodeIfPresent(String.self, forKey: .apple_verify)
		rating_count = try values.decodeIfPresent(String.self, forKey: .rating_count)
		is_followed = try values.decodeIfPresent(String.self, forKey: .is_followed)
		rating_details = try values.decodeIfPresent(Rating_details.self, forKey: .rating_details)
	}

}