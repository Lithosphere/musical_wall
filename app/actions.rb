helpers do
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

enable :sessions

# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs/new' do
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    url: params[:url],
    song_title: params[:song_title],
    author: params[:author],
    created_at: params[:created_at],
    user_id: current_user.id
    )
  if @song.save
  redirect '/index'
  else
    erb :'songs/new'
  end
end

get '/index' do
  @songs = Song.all
  erb :'songs/index'
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  user = User.new(
    username: params[:username],
    password: params[:password],
    created_at: params[:created_at]
    )
  if user.save
    session[:user_id] = user.id
   redirect '/'
  else
    erb :new_user
  end
end

get '/log_in' do
  erb :log_in
end

post '/log_in' do
  user = User.where(username: params[:username], password: params[:password]).first
  if user 
    session[:user_id] = user.id
    redirect '/'
  else
    erb :log_in
  end
end


get '/log_out' do
  session.clear
  redirect '/'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @upvote = Upvote.find_by(song_id: params[:id], user_id: session[:user_id].to_i)
  if @upvote.nil? #The logged user has not voted for that song id
    session[:error] = false
  else
    session[:error] = true
  end
  erb :show_details
end

post '/songs/upvote/:id' do

  # @upvote = Upvote.find_by(song_id: params[:id], user_id: session[:user_id].to_i)
  # if @upvote.nil? #The logged user has not voted for that song id
    song = Song.find(params[:id] )
    upvote = Upvote.create(
    user_id: session[:user_id].to_i,
    song_id: params[:id],
    upvoted?: true
    )
    # session[:error] = false
    redirect "/songs/#{song.id}"
  
  
end


