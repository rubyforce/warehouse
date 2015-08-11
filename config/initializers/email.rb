if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
elsif (Rails.env.test? or Rails.env.cucumber?)
  ActionMailer::Base.default_url_options[:host] = 'test.host'
elsif Rails.env.staging?
  ActionMailer::Base.default_url_options[:host] = 'greenarea-staging.herokuapp.com'
end

