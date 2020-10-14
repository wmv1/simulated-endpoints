class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    mock = Mock.find_by_path(request.env['REQUEST_URI'])
    sleep mock.timeout

    render json: mock.content, status: mock.status
  rescue
    client = GenericClient.new

    if request.env['REQUEST_METHOD'] == "GET"
      response = client.get(request.env['REQUEST_URI'])
    elsif request.env['REQUEST_METHOD'] == "PUT"
      response = client.put(request.env['REQUEST_URI'], params)
    elsif request.env['REQUEST_METHOD'] == "POST"
      response = client.post(request.env['REQUEST_URI'], params)
    end

    render json: response.body, status: response.status
  end
end
