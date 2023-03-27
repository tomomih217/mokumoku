# frozen_string_literal: true

class Mypage::EventCalendarsController < Mypage::BaseController
  def show
    @bookmark_events = current_user.bookmark_events
    @future_events = current_user.attend_events.future
    @past_events = current_user.attend_events.past
    @follow_events = Event.joins(:attendees).where("event_attendances.user_id IN (?) OR events.user_id = ?", current_user.following_ids, current_user.id)
  end
end
