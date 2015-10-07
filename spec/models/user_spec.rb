require 'rails_helper'

# see https://gist.github.com/kyletcarlson/6234923 for rspec Model testing template
describe User do

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	let(:user) { build(:user) }

	describe "ActiveModel validations" do

		# Format validations
	    it { expect(user).to allow_value("dhh@nonopinionated.com").for(:email) }
	    it { expect(user).to_not allow_value("base@example").for(:email) }
	    it { expect(user).to_not allow_value("blah").for(:email) }

	end

	describe "ActiveRecord associations" do

	    # Databse columns/indexes
	    it { expect(user).to have_db_column(:provider).of_type(:string) }
	    it { expect(user).to have_db_column(:uid).of_type(:string) }
	    it { expect(user).to have_db_column(:name).of_type(:string) }
	    it { expect(user).to have_db_column(:email).of_type(:string).with_options(default: "", null: false) }
	    it { expect(user).to have_db_column(:is_admin).of_type(:boolean).with_options(default: false, null: false) }

	    it { expect(user).to have_db_index(:email).unique(:true) }
	    
	end

	context "callbacks" do
		# http://guides.rubyonrails.org/active_record_callbacks.html
		# https://github.com/beatrichartz/shoulda-callback-matchers/wiki

	end


  describe "scopes" do

  end

	describe "public instance methods" do
		context "responds to its methods" do
			# it { expect(factory_instance).to respond_to(:public_method_name) }
		end

		context "executes methods correctly" do
			context "#method name" do
				it "does what it's supposed to..." do
					#expect(factory_instance.method_to_test).to eq(value_you_expect)
				end
			end
		end
	end

	describe "public class methods" do
		context "responds to its methods" do
			#it { expect(factory_instance).to respond_to(:public_method_name) }
		end

		context "executes methods correctly" do
			context "self.method name" do
				it "does what it's supposed to..." do
					#expect(factory_instance.method_to_test).to eq(value_you_expect)
				end
			end
		end
	end

end





