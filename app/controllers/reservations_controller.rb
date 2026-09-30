class ReservationsController < ApplicationController
    def new
        if params[:schedule_id].blank? || params[:seat_id].blank? || params[:date].blank?
            redirect_to movie_reservation_path(params[:movie_id]), alert: "スケジュール、座席、日付を選択してください"
            return
        end 
        @movie = params[:movie_id] ? Movie.find(params[:movie_id]) : nil
        @schedule = params[:schedule_id] ? Schedule.find(params[:schedule_id]) : nil
        @seat = params[:seat_id] ? Seat.find(params[:seat_id]) : nil
        @date = params[:date] || Date.today.to_s
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reserved = Reservation.where(schedule_id: @reservation.schedule_id, seat_id: @reservation.seat_id, date: @reservation.date)
        if @reserved.exists?
            redirect_to movie_reservation_path(id: params.dig(:reservation, :movie_id), schedule_id: @reservation.schedule_id, date: params.dig(:reservation, :date)), alert: "この座席はすでに予約されています。"
            return
        end

        if @reservation.save
            redirect_to "/movies/#{params.dig(:reservation, :movie_id)}/"
            flash[:notice] = "予約が完了しました"
        elsif @reservation.errors[:seat_id].any?
            redirect_to movie_reservation_path(id: params.dig(:reservation, :movie_id), schedule_id: @reservation.schedule_id, date: params.dig(:reservation, :date)), alert: "この座席はすでに予約されています。"
        else
            @movie = params.dig(:reservation, :movie_id) ? Movie.find(params.dig(:reservation, :movie_id)) : nil
            @schedule = params.dig(:reservation, :schedule_id) ? Schedule.find(params.dig(:reservation, :schedule_id)) : nil
            @seat = params.dig(:reservation, :seat_id) ? Seat.find(params.dig(:reservation, :seat_id)) : nil
            @date = params.dig(:reservation, :date) || Date.today.to_s
            render :new
        end
    end

    private
    def reservation_params
        params.require(:reservation).permit(:schedule_id, :seat_id, :date, :name, :email)
    end 

end

