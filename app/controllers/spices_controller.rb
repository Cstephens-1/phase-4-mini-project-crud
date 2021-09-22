class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.new(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: {error: spice.errors.full_message}
            
        end
    end

    def update
        spice = find_spice
        render json: spice.update(spice_params)
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content

    end







    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

end
