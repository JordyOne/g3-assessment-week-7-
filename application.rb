require 'sinatra/base'
require 'gschool_database_connection'
require './lib/country_list'
require_relative 'lib/database_commands'

class Application < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @sql = DatabaseCommands.new
  end

  get '/' do
    erb :index
  end


  post "/" do
    @sql.insert_user_and_mess(params[:name], params[:message])
    flash[:notice] = params[:message]
    redirect "/"
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: {continents: all_continents}
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: {countries: list_of_countries, continent: params[:continent_name]}
  end

end

private

def current_user_id(name, message)
  @database_connection.sql("SELECT id FROM users WHERE username = '#{name}' AND password = '#{message}'")
end
