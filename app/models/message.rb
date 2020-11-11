class Message < ApplicationRecord
  belomgs_to :room
  belomgs_to :user
end
