class SeatReserveMatch
    Result = Struct.new(:reserved, :non_reserved)

    def initialize(schedule, date, seat)
        @schedule = schedule
        @date = date
        @seat = seat
    end

    def call
        reserved_ids = Reservation.where(schedule_id: @schedule.id, date: @date).pluck(:seat_id)
        reserved, non_reserved = @seat.partition { |seat| reserved_ids.include?(seat.id) }
        Result.new(reserved, non_reserved)
    end
end