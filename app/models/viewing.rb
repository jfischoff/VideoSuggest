class Viewing < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    view_date :datetime
    rating enum_string(:like, :dislike, :unrated)
    timestamps
  end

  belongs_to :user
  belongs_to :video
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
