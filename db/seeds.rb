User.destroy_all
# Project.destroy_all

User.create do |user|
  user.first_name            = "Super"
  user.last_name             = "Admin"
  user.email                 = "admin@example.com"
  user.password              = "password"
  user.password_confirmation = "password"
  user.role                  = 'admin'
  user.status                = 'approved'
end
