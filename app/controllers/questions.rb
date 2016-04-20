get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :"/questions/index"
end

post '/questions' do
  params[:question][:creator] = User.first ############# current logged in user
  question = Question.new(params[:question])
  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :"/questions/index"
  end
end