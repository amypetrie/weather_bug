class Api::V1::FavoritesController < ActionController::API

  def create
    user = User.find_by(api_key: favorite_params[:api_key])
      if user
        user.favorites.create(location: favorite_params[:location])
        render status: 201
      else
        render status: 401
      end
  end

  def show
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
      render json: FavoriteSerializer.new(user.favorites)
    else
      render status: 401
    end
  end

  private

    def favorite_params
      params.permit(:api_key, :location)
    end

end
