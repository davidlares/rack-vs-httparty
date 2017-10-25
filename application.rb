require 'erb'
require 'httparty'

class Application
  def self.call(env)
    if env['PATH_INFO'] == '/'
      response = HTTParty.get('http://jsonplaceholder.typicode.com/posts')
      @mensaje = "Hola David"
      @posts = JSON.parse(response.body)
      body = ERB.new(File.read('index.html.erb'))
      [200,{},[body.result(binding)]]
    else
      [404,{},['No existe esta pagina']]
    end
  end
end
