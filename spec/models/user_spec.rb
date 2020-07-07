require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", family_name: "田中", first_name: "太郎", family_name_kana: "たなか", first_name_kana: "たろう", birthday: "2019-05-07", email: "test@gmail.com", password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
