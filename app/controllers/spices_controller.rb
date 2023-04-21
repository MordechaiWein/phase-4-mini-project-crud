class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(strong_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(strong_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private

    def strong_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

end
