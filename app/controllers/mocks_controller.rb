class MocksController < ApplicationController
  def index
    @mocks = Mock.all
  end

  def show
    @mock = Mock.find(params[:id])
  end

  def new
    @mock = Mock.new
  end

  def create
    mock = Mock.create(mock_params)

    redirect_to mocks_path
  end

  def update
    @mock = Mock.find(params[:id])
    @mock.update(mock_params)

    redirect_to mock_path(@mock)
  end

  def edit
    @mock = Mock.find(params[:id])
  end

  def destroy
    @mock = Mock.find(params[:id])
    @mock.destroy

    redirect_to mocks_path
  end

  private
  def mock_params
    params.require(:mock).permit(:path, :status, :content)
  end

end

# t.string "path"
# t.string "status"
# t.string "content"
