require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email, username and password' do
    user = User.new(
      email: 'user_test@gmail.com',
      username: 'user_test',
      password: 'user_secret'
    )

    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(
      username: 'user_test',
      password: 'user_secret'
    )

    user.valid?

    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without an usename' do
    user = User.new(
      email: 'user_test@gmail.com',
      password: 'user_secret'
    )

    user.valid?

    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(
      email: 'user_test@gmail.com',
      username: 'user_test',
    )

    user.valid?

    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    user1 = User.new(
      email: 'user_test@gmail.com',
      username: 'user_test1',
      password: 'user_secret1'
    )

    user1.save!

    user2 = User.new(
      email: 'user_test@gmail.com',
      username: 'user_test2',
      password: 'user_secret2'
    )

    user2.valid?

    expect(user2.errors[:email]).to include("has already been taken")
  end
end
