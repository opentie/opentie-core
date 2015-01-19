# coding: utf-8
require_relative 'spec_helper'

RSpec.describe Opentie::Core::Project, :type => :model do
  describe "FakeProject" do
    it "should be able to create" do
      FakeProject.create!(hoge: :foo)
    end

    it "should be querable" do
      a = FakeProject.create(hoge: :foo)
      b = FakeProject.create(hoge: :bar)

      x = FakeProject.where(hoge: :foo)
      expect(x.first.id).to eq(a.id)
      expect(x.first.hoge).to eq(:foo)

      y = FakeProject.where(hoge: :bar)
      expect(y.first.id).to eq(b.id)
      expect(y.first.hoge).to eq(:bar)
    end
  end
end
