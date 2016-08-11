# coding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  it "作成できるか" do
    u = User.new()
    expect(u).to be_valid
  end
end
