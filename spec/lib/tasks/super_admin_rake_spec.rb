# spec/lib/tasks/reports_rake_spec.rb
require 'rails_helper'
require 'rspec/mocks/standalone'

describe "super_admin:list_users" do
	include_context "rake"

	let(:user_records) { double("user records") }
	let(:hirb_table) { double("hirb generated table") }

	before do
		allow(User).to receive(:all).and_return(:user_records)
		allow(Hirb::Helpers::AutoTable).to receive(:render).and_return(:hirb_table)
		allow(STDOUT).to receive(:puts)
	end

	describe "init" do
        it { expect(subject.prerequisites).to include("environment") }
	end
	it "retrieves all the User records" do
		subject.invoke
		expect(User).to have_received(:all)
	end
	it "generates a hirb table of all users with fields [:email, :name, :id, :is_admin]" do
		subject.invoke
		expect(Hirb::Helpers::AutoTable).to have_received(:render).with(:user_records, {:fields=>[:email, :name, :id, :is_admin]})
	end
	it "outputs the hirb table" do
		subject.invoke
		expect(STDOUT).to have_received(:puts).with(:hirb_table)
	end
end

describe "super_admin:grant_admin_permission" do
	include_context "rake"

	before do
		allow(STDOUT).to receive(:puts)
	end


	
	describe "init" do
        it { expect(subject.prerequisites).to include("environment") }
	end

	it "sets is_admin to true and saves the user" do
		subject.invoke
		expect(STDOUT).to have_received(:puts).with("usage: rake super_admin:grant_admin_permission[< user's id >]")
	end
end

describe "super_admin:grant_admin_permission" do
	include_context "rake"

	before do
		@user1 = FactoryGirl.create(:user)
		allow(@user1).to receive(:save!)
		allow(User).to receive(:find_by).with({:id=>1}).and_return(@user1)
	end
	
	describe "init" do
        it { expect(subject.prerequisites).to include("environment") }
	end

	it "sets is_admin to true and saves the user" do
		expect(@user1.is_admin).to eql(false)
		subject.invoke(1)
		expect(@user1.is_admin).to eql(true)
		expect(@user1).to have_received(:save!)
	end
end






