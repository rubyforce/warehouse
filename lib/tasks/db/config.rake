namespace :db do
  namespace :config do
    task :copy do
      FileUtils.cp Rails.root.join("config/database.yml.sample"), Rails.root.join("config/database.yml")
    end
  end
end

