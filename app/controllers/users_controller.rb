class UsersController < SecuredController
  skip_before_action :verify_authenticity_token, raise: false

  def index
    @users = User.all

    render json: @users
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
      render json: @user
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update!(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.delete
        render json: { id: @user.id }, status: 200
    else
      render json: @user.errors
    end
  end

  def me
    @user = current_user

    render json: @user
  end

  private
  def user_params
    params.permit(
      :email,
      :first_name,
      :last_name,
      :mobile
    )
  end
end
