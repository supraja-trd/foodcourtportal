class MealPreference < ActiveRecord::Base

    validates :office_email , presence: true
    validates :meal_date , presence: true
    validates :breakfast , presence: true
    validates :lunch , presence: true
    validates :dinner , presence: true

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name Rails.application.class.parent_name.underscore
    document_type self.name.downcase

    settings index: { number_of_shards: 1 } do
        mapping dynamic: false do
          indexes :office_email, analyzer: 'english'
          indexes :breakfast, analyzer: 'english'
          indexes :lunch, analyzer: 'english'
          indexes :dinner, analyzer: 'english'
        end
    end

    def self.search(search_keys,search_value)
        __elasticsearch__.search(
        {
          query: {
             multi_match: {
               query: search_value,
               fields: search_keys
             }
             
           },
           suggest: {
            text: search_value,
            office_email: {
                term: {
                size: 1,
                field: :office_email
                }
            },
            breakfast: {
                term: {
                size: 1,
                field: :breakfast
                }
            },
            lunch: {
                term: {
                size: 1,
                field: :lunch
                }
            },
            dinner: {
                term: {
                    size: 1,
                    field: :dinner
                }
            },
          },
        }
        )
     end
end
