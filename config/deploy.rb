
## Чтобы не хранить database.yml в системе контроля версий, поместите
## dayabase.yml в shared-каталог проекта на сервере и раскомментируйте
## следующие строки.

# after "deploy:update_code", :copy_database_config
# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end


# Для удобства работы мы рекомендуем вам настроить авторизацию
# SSH по ключу. При работе capistrano будет использоваться
# ssh-agent, который предоставляет возможность пробрасывать
# авторизацию на другие хосты.
# Если вы не используете авторизацию SSH по ключам И ssh-agent,
# закомментируйте эту опцию.
# ssh_options[:forward_agent] = true

# Имя вашего проекта в панели управления.
# Не меняйте это значение без необходимости, оно используется дальше.
set :application,     "predictions"

# Сервер размещения проекта.
set :deploy_server,   "hosting_pentium133@hydrogen.locum.ru"

# Не включать в поставку разработческие инструменты и пакеты тестирования.
set :bundle_without,  [:development, :test]

set :user,            "hosting_pentium133"
set :login,           "pentium133"
set :use_sudo,        false
set :deploy_to,       "/home/#{fetch(:user)}/projects/#{fetch(:application)}"
set :shared_path,     "/home/#{fetch(:user)}/shared"
set :unicorn_conf,    "/etc/unicorn/#{fetch(:application)}.#{fetch(:login)}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{fetch(:user)}/#{fetch(:application)}.#{fetch(:login)}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            fetch(:deploy_server)
role :app,            fetch(:deploy_server)
role :db,             fetch(:deploy_server), :primary => true

# Следующие строки необходимы, т.к. ваш проект использует rvm.
set :rvm_ruby_string, "2.2.0"
set :rake,            "rvm use #{fetch(:rvm_ruby_string)} do bundle exec rake"
set :bundle_cmd,      "rvm use #{fetch(:rvm_ruby_string)} do bundle"

# Настройка системы контроля версий и репозитария,
# по умолчанию - git, если используется иная система версий,
# нужно изменить значение scm.
set :scm,             :git

# Предполагается, что вы размещаете репозиторий Git в вашем
# домашнем каталоге в подкаталоге git/<имя проекта>.git.
# Подробнее о создании репозитория читайте в нашем блоге
# http://locum.ru/blog/hosting/git-on-locum
set :repository,      "git@bitbucket.org:pentium133/velo-prognose.git"
set :repo_url, "git@bitbucket.org:pentium133/velo-prognose.git"

## Если ваш репозиторий в GitHub, используйте такую конфигурацию
# set :repository,    "git@github.com:username/project.git"

## --- Ниже этого места ничего менять скорее всего не нужно ---

before 'deploy:finished', 'set_current_release'
task :set_current_release do
    set :current_release, latest_release
end

set :unicorn_start_cmd, "(cd #{fetch(:deploy_to)}/current; rvm use #{fetch(:rvm_ruby_string)} do bundle exec unicorn_rails -Dc #{fetch(:unicorn_conf)})"


# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop do
    run "[ -f #{fetch(:unicorn_pid)} ] && kill -QUIT `cat #{fetch(:unicorn_pid)}`"
  end

  desc "Restart Application"
  task :restart do
    run "[ -f #{fetch(:unicorn_pid)} ] && kill -USR2 `cat #{fetch(:unicorn_pid)}` || #{fetch(:unicorn_start_cmd)}"
  end
end