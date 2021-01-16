class UsersController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        if (@user && current_user)
            if (current_user.id == params[:id].to_i)
                @thisshouldbetrue = "true"
                @images = @user.images.all
            end 
        else
            @images = @user.images.all.where(public: 'true')
        end
    end
end
