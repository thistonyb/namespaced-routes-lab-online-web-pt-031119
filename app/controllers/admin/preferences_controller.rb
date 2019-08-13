class Admin::PreferencesController < ApplicationController
  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      redirect_to @preference
    else
      render :new
    end
  end

  def edit
    @preference = Preference.find(params[:id])
  end

  def update
    @preference = Preference.find(params[:id])

    @preference.update(preference_params)

    if @preference.save
      redirect_to admin_preference_path(@preference)
    else
      render :edit
    end
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    flash[:notice] = "Preference deleted."
    redirect_to admin_preferences_path
  end

  private

  def preference_params
    params.require(:preference).permit(:song_sort_order, :artist_sort_order, :allow_create_songs, :allow_create_artists)
  end
end
