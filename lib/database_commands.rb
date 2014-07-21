
require "gschool_database_connection"

class DatabaseCommands
  def initialize
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  def insert_user_and_mess(name,message)
    @database_connection.sql("INSERT INTO users_messeages (name,message) VALUES ('#{name}', '#{message}')")
  end

  def list_message(name)
    @database_connection.sql("SELECT message from users_messeages where name = '#{name}'")
  end
end