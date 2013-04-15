require 'pry'
require 'pry-rails'
require 'better_errors'
require 'better_errors/rails'

BetterErrors.use_pry!

Pry.hooks.add_hook :when_started, :preload_for_speedy_show_models do
  Thread.start do
    Rails.application.eager_load!
    save_pos      = "\e[s"
    goto_top_left = "\e[0;0H"
    restore_pos   = "\e[u"
    periwinkle    = "\e[38;5;67m"
    brightblue    = "\e[38;5;51m"
    color_off     = "\e[0m"
    print [
      save_pos, goto_top_left,
      '[',
      periwinkle, 'pry-better_rails finished background eager_load!, ',
      brightblue, 'show-models',
      periwinkle, ' now loaded',
      color_off,
      ']',
      restore_pos
    ].join
  end
end

# TODO
# FactoryGirl.reload

module PryBetterRails
  class DbQuietLog < Pry::ClassCommand
    match 'db-quiet-log'
    group 'Rails'
    description 'Silence ActiveRecord logs'
    def process
      ActiveRecord::Base.logger = nil
    end
  end
  Pry::Commands.add_command DbQuietLog

  class DbLoudLog < Pry::ClassCommand
    match 'db-loud-log'
    group 'Rails'
    description 'Verbosify ActiveRecord logs'
    def process
      ActiveRecord::Base.logger = Logger.new $stderr
    end
  end
  Pry::Commands.add_command DbLoudLog
end
