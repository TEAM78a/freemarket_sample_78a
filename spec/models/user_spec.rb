require 'rails_helper'

describe User do
  describe '#create' do

    context 'can save' do
      it "User：全ての必須項目が入力されている場合登録できる" do
        user = create(:user)
        expect(user).to be_valid
      end

      it "SendDestination：全ての必須項目が入力されている場合登録できる" do
        send_destination = create(:send_destination)
        expect(send_destination).to be_valid
      end
    end

    context 'User can not save' do
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

    context 'SendDestination can not save' do
      it "SendDestination.family_nameがnullの場合は登録できない" do
        send_destination = build(:send_destination, family_name: "")
        send_destination.valid?
        expect(send_destination.errors[:family_name]).to include("can't be blank")
      end

      it "SendDestination.family_nameが半角の場合は登録できない" do
        send_destination = build(:send_destination, family_name: "ﾀﾅｶ")
        send_destination.valid?
        expect(send_destination.errors[:family_name]).to include("is invalid")
      end

      it "SendDestination.family_nameが数字の場合は登録できない" do
        send_destination = build(:send_destination, family_name: "123")
        send_destination.valid?
        expect(send_destination.errors[:family_name]).to include("is invalid")
      end

      it "SendDestination.first_nameがnullの場合は登録できない" do
        send_destination = build(:send_destination, first_name: "")
        send_destination.valid?
        expect(send_destination.errors[:first_name]).to include("can't be blank")
      end

      it "SendDestination.first_nameが半角の場合は登録できない" do
        send_destination = build(:send_destination, first_name: "ﾀﾛｳ")
        send_destination.valid?
        expect(send_destination.errors[:first_name]).to include("is invalid")
      end

      it "SendDestination.first_nameが数字の場合は登録できない" do
        send_destination = build(:send_destination, first_name: "123")
        send_destination.valid?
        expect(send_destination.errors[:first_name]).to include("is invalid")
      end

      it "SendDestination.family_name_kanaがnullの場合は登録できない" do
        send_destination = build(:send_destination, family_name_kana: "")
        send_destination.valid?
        expect(send_destination.errors[:family_name_kana]).to include("can't be blank")
      end

      it "SendDestination.family_name_kanaが半角の場合は登録できない" do
        send_destination = build(:send_destination, family_name_kana: "ﾀﾅｶ")
        send_destination.valid?
        expect(send_destination.errors[:family_name_kana]).to include("is invalid")
      end

      it "SendDestination.family_name_kanaが数字の場合は登録できない" do
        send_destination = build(:send_destination, family_name_kana: "123")
        send_destination.valid?
        expect(send_destination.errors[:family_name_kana]).to include("is invalid")
      end

      it "SendDestination.family_name_kanaがカタカナの場合は登録できない" do
        send_destination = build(:send_destination, family_name_kana: "タナカ")
        send_destination.valid?
        expect(send_destination.errors[:family_name_kana]).to include("is invalid")
      end

      it "SendDestination.family_name_kanaが漢字の場合は登録できない" do
        send_destination = build(:send_destination, family_name_kana: "田中")
        send_destination.valid?
        expect(send_destination.errors[:family_name_kana]).to include("is invalid")
      end

      it "SendDestination.first_name_kanaがnullの場合は登録できない" do
        send_destination = build(:send_destination, first_name_kana: "")
        send_destination.valid?
        expect(send_destination.errors[:first_name_kana]).to include("can't be blank")
      end

      it "SendDestination.first_name_kanaが半角の場合は登録できない" do
        send_destination = build(:send_destination, first_name_kana: "ﾀﾛｳ")
        send_destination.valid?
        expect(send_destination.errors[:first_name_kana]).to include("is invalid")
      end

      it "SendDestination.first_name_kanaが数字の場合は登録できない" do
        send_destination = build(:send_destination, first_name_kana: "123")
        send_destination.valid?
        expect(send_destination.errors[:first_name_kana]).to include("is invalid")
      end

      it "SendDestination.first_name_kanaがカタカナの場合は登録できない" do
        send_destination = build(:send_destination, first_name_kana: "タロウ")
        send_destination.valid?
        expect(send_destination.errors[:first_name_kana]).to include("is invalid")
      end

      it "SendDestination.first_name_kanaが漢字の場合は登録できない" do
        send_destination = build(:send_destination, first_name_kana: "太郎")
        send_destination.valid?
        expect(send_destination.errors[:first_name_kana]).to include("is invalid")
      end

      it "postal_codeがnullの場合は登録できない" do
        send_destination = build(:send_destination, postal_code: "")
        send_destination.valid?
        expect(send_destination.errors[:postal_code]).to include("can't be blank")
      end

      it "postal_codeにハイフンが入る場合は登録できない" do
        send_destination = build(:send_destination, postal_code: "123-4567")
        send_destination.valid?
        expect(send_destination.errors[:postal_code]).to include("is not a number")
      end

      it "prefecturesがnullの場合は登録できない" do
        send_destination = build(:send_destination, prefectures: "")
        send_destination.valid?
        expect(send_destination.errors[:prefectures]).to include("can't be blank")
      end

      it "municipalitiesがnullの場合は登録できない" do
        send_destination = build(:send_destination, municipalities: "")
        send_destination.valid?
        expect(send_destination.errors[:municipalities]).to include("can't be blank")
      end

      it "addressがnullの場合は登録できない" do
        send_destination = build(:send_destination, address: "")
        send_destination.valid?
        expect(send_destination.errors[:address]).to include("can't be blank")
      end

      it "buildingがnullであっても登録できる" do
        send_destination = build(:send_destination, building: "")
        expect(send_destination).to be_valid
      end

      it "phone_numberがnullの場合は登録できない" do
        send_destination = build(:send_destination, phone_number: "")
        send_destination.valid?
        expect(send_destination.errors[:phone_number]).to include("can't be blank")
      end

      it "phone_numberにハイフンが入る場合は登録できない" do
        send_destination = build(:send_destination, phone_number: "080-1234-5678")
        send_destination.valid?
        expect(send_destination.errors[:phone_number]).to include("is not a number")
      end

    end

  end
end