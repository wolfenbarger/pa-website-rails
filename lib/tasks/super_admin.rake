# see http://railsguides.net/how-to-generate-rake-task/ for custom task generation
namespace :super_admin do

	desc "Help"
	task :help => [:environment] do |t, args|
		puts " to list all users           rake super_admin:list_users   "
		puts " to make a user an admin     rake super_admin:grant_admin_permission[x]   "
		puts "    where x is the id of the user"
		puts " to revoke admin privleges   rake super_admin:revoke_admin_permission[x]   "
		puts "    where x is the id of the user"
	end

	desc "Lists all users"
	task :list_users => [:environment] do |t, args|
		users = User.all
		puts Hirb::Helpers::AutoTable.render users, :fields=>[:email, :name, :id, :is_admin]
		puts "For syntax of how to grant or revoke admin privs, type rake super_admin:help"
	end

	desc "Grants a user admin permission"
	task :grant_admin_permission, [:id] => [:environment] do |t, args|
		user = User.find_by(id: args.id)
		if !user
			puts "No user found with id: #{args.id}"
		else
			user.is_admin = true
			user.save!
		end
	end

	desc "Revokes a user admin permission"
	task :revoke_admin_permission, [:id] => [:environment] do |t, args|
		user = User.find_by(id: args.id)
		if !user
			puts "No user found with id: #{args.id}"
		else
			user.is_admin = false
			user.save!
		end
	end



end
