class HomeController < ApplicationController
  def index
    mock = Mock.find_by_path(request.fullpath)
    sleep mock.timeout

    render json: mock.content, status: mock.status
  rescue
    flash[:alert] = "Mock \"#{request.fullpath}\" não encontrado"
    redirect_to mocks_path
  end
end
