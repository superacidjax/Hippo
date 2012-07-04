require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

before do
	headers "Content-Type" => "text/html; charset=utf-8"
end

helpers do

  def link_to(url,text=url,opts={})
    attributes = ""
    opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
    "<a href=\"#{url}\" #{attributes}>#{text}</a>"
  end

end

get '/' do
	@title = "Hip Hippos!"
	haml :home
end

get '/gallery' do
  @title = "Hip Hippo Gallery"
  haml :gallery
end

get '/application.css' do
	headers 'Content-Type' => 'text/css; charset=utf-8'
	sass :style
end

get '/home.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :home
end