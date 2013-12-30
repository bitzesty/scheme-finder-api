class SchemeLocationRelationship < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :scheme
  belongs_to :location # active hash
end
