class Video < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    url   :string
    title :string
    timestamps
  end
  
  has_many :viewings, :dependent => :destroy
  has_many :expected_probs, :dependent => :destroy

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
