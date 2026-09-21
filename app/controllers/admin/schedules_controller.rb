class Admin::SchedulesController < ApplicationController
    def index
        @schedules = Schedule.left_outer_joins(:movie).select('*, schedules.id as schedule_id, movies.name')
    end

    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(schedule_params)

        if @schedule.save
            redirect_to "/admin/schedules"
        else
            flash.now[:alert] = "エラー"
            render :new
        end
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])

        if @schedule.update(schedule_params)
            redirect_to "/admin/schedules"
        else
            flash.now[:alert] = "エラー"
            render :edit
        end
    end

    def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy

        flash[:success] = "削除が完了しました"
        redirect_to "/admin/schedules"
    end

    def show
        @schedule = Schedule.find(params[:id])
    end

    private
    def schedule_params
        params.require(:schedule).permit(:id, :movie_id, :start_time, :end_time, :created_at, :updated_at)
    end
end
