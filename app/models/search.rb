class Search < ApplicationRecord
    # broadcasts_to ->(search) { :searches }

    # after_create_commit :update_index_view
end
