class Admin::SchedulesController < ApplicationController
    def index
        @schedules = Schedule.left_outer_joins(:movie).select('*, schedules.id as schedule_id, movies.name')
    end

    def new
        @schedules = Schedule.new
    end

    def create
        @schedule = Schedule.new(schedule_params)

        if @schedule.save
            redilect_to "/admin/schedules"
        else
            flash.now[:alert] = "エラー"
            render :new
        end
    end

    def edit
        @schedule = Schedule.find(schedule_params[:id])
    end

    def update
        @schedule = Schedule.new(schedule_params)

        if @schedule.save
            redilect_to "/admin/schedules"
        else
            flash.now[:alert] = "エラー"
            render :new
        end
    end

    private
    def schedule_params
        params.permit(:id, :movie_id, :start_time, :end_time, :created_at, :updated_at)
    end
end
