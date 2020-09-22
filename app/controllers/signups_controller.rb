class SignupsController < ApplicationController

    def new
        @signup = Signup.new
    end

    def create
        signup = Signup.create(params.require(:signup).permit!)

        redirect_to camper_path(signup.camper)
    end

end
