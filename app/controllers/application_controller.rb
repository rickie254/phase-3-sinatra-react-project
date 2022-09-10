class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
  todos=Todos.all 
  todos.to_json
  end

  post '/todos' do
    todos=Todos.create(
      name: params[:name],
    )
    todos.to_json
  end

  delete '/todos/:id' do
    todos=Todos.find(params[:id])
    todos.destroy
    todos.to_json
  end
end
