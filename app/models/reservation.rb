class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :seat
    validates :seat_id, uniqueness: { scope: [:schedule_id, :date], message: "この座席はすでに予約されています。" }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "正しいメールアドレスを入力してください。" }
end