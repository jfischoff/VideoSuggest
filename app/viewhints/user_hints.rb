class UserHints < Hobo::ViewHints

  children :viewings
  children :expected_probs
  # children :primary_collection1, :aside_collection1, :aside_collection2

end
