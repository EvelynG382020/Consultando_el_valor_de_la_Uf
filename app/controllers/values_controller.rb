class ValuesController < ApplicationController
    def by_date
        @user = User.find_by(name:request.headers["X-CLIENTE"])
        @user.consult += 1 #mi atributo consult va aumentando en uno
        @user.save #lo guarda en mi instancia
        @value = Value.find_by(date: params[:date])
        render json: @value
    end
end