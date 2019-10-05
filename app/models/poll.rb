    class Poll < ApplicationRecord
        after_commit :notify_pusher, on: [:create, :update]
        def notify_pusher
        Pusher.trigger('poll', 'new', self.as_json)
        end  
    end