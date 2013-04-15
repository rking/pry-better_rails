require 'pry'
require 'pry-rails'
require 'better_errors'
require 'better_errors/rails'

BetterErrors.use_pry!

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
