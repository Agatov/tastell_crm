class Place < ActiveRecord::Base
  attr_accessible :address, :city, :contact_name, :name, :phones, :state_cd, :state, :user_id

  belongs_to :user
  has_many :comments
  has_many :place_states
  has_many :events

  include Statable

  define_index do
    indexes name, address, phones
    has state_cd
  end

  sphinx_scope(:with_ts_state) do |state|
    {with: {state_cd: Place.states(state)}} unless state.nil?
  end

  def change_state(state, user)
    update_attributes(state: state)
    place_state = self.place_states.create(state: state, user: user)

    Builders::EventBuilder.new.build_state_changed(
        user: user,
        place_state: place_state,
        place: self
    ).save
  end

  def add_comment(comment)
    comment.place = self
    comment.save
    Builders::EventBuilder.new.build_comment_added(
        user: comment.user,
        comment: comment,
        place: self
    ).save
  end

end
