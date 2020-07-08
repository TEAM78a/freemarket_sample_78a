require 'rails_helper'

describe User do
  describe '#create' do

    # context 'can save' do
    #   it "全ての必須項目が入力されている場合登録できる" do
    # end

    context 'can not save' do
      it "nicknameがnullの場合は登録できない" do
      user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "family_nameがnullの場合は登録できない" do
        user = build(:user, family_name: "")
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
      end

      it "family_nameが半角の場合は登録できない" do
        user = build(:user, family_name: "ﾀﾅｶ")
        user.valid?
        expect(user.errors[:family_name]).to include("is invalid")
      end

      it "family_nameが数字の場合は登録できない" do
        user = build(:user, family_name: "123")
        user.valid?
        expect(user.errors[:family_name]).to include("is invalid")
      end

      it "first_nameがnullの場合は登録できない" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "first_nameが半角の場合は登録できない" do
        user = build(:user, first_name: "ﾀﾛｳ")
        user.valid?
        expect(user.errors[:first_name]).to include("is invalid")
      end

      it "first_nameが数字の場合は登録できない" do
        user = build(:user, first_name: "123")
        user.valid?
        expect(user.errors[:first_name]).to include("is invalid")
      end

      it "family_name_kanaがnullの場合は登録できない" do
        user = build(:user, family_name_kana: "")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("can't be blank")
      end

      it "family_name_kanaが半角の場合は登録できない" do
        user = build(:user, family_name_kana: "ﾀﾅｶ")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("is invalid")
      end

      it "family_name_kanaが数字の場合は登録できない" do
        user = build(:user, family_name_kana: "123")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("is invalid")
      end

      it "family_name_kanaが漢字の場合は登録できない" do
        user = build(:user, family_name_kana: "田中")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("is invalid")
      end

      it "first_name_kanaがnullの場合は登録できない" do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "first_name_kanaが半角の場合は登録できない" do
        user = build(:user, first_name_kana: "ﾀﾛｳ")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("is invalid")
      end

      it "first_name_kanaが数字の場合は登録できない" do
        user = build(:user, first_name_kana: "123")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("is invalid")
      end

      it "first_name_kanaが漢字の場合は登録できない" do
        user = build(:user, first_name_kana: "太郎")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("is invalid")
      end

      it "birthdayがnullの場合は登録できない" do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end

      it "emailがnullの場合は登録できない" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "emailが重複する場合は登録できない" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "passwordがnullの場合は登録できない" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "passwordが7文字以上であれば登録できる" do
        user = build(:user, password: "1234567", password_confirmation: "1234567")
        expect(user).to be_valid
      end

      it "passwordが6文字以下であれば登録できない" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end

      it "passwordとpassword_confirmationが一致していないと登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end

  end
end
