/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Default_photo : Codable {
	let img_id : String?
	let img_parent_id : String?
	let img_type : String?
	let img_path : String?
	let img_width : String?
	let img_height : String?
	let img_desc : String?

	enum CodingKeys: String, CodingKey {

		case img_id = "img_id"
		case img_parent_id = "img_parent_id"
		case img_type = "img_type"
		case img_path = "img_path"
		case img_width = "img_width"
		case img_height = "img_height"
		case img_desc = "img_desc"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		img_id = try values.decodeIfPresent(String.self, forKey: .img_id)
		img_parent_id = try values.decodeIfPresent(String.self, forKey: .img_parent_id)
		img_type = try values.decodeIfPresent(String.self, forKey: .img_type)
		img_path = try values.decodeIfPresent(String.self, forKey: .img_path)
		img_width = try values.decodeIfPresent(String.self, forKey: .img_width)
		img_height = try values.decodeIfPresent(String.self, forKey: .img_height)
		img_desc = try values.decodeIfPresent(String.self, forKey: .img_desc)
	}
    
    init(img_path:String?) {
        self.img_path = img_path
        self.img_id = nil
        self.img_parent_id = nil
        self.img_type = nil
        self.img_width = nil
        self.img_height = nil
        self.img_desc = nil
    }

}
