class Activity < ActiveHash::Base
  self.data = [
    { id: "apprenticeships", name: "Apprenticeships" },
    { id: "work_experience", name: "Work experience" },
    { id: "workplace_visits", name: "Workplace visits" },
    { id: "hands_on_talks", name: "Hands-on activities" },
    { id: "inspiring_talks", name: "Inspiring talks" },
    { id: "ambasadors", name: "Ambassadors" },
    { id: "lesson_materials", name: "Lesson materials" },
  ]

  def to_s
    name
  end

  def self.collection
    all
  end

  def self.ids
    all.map(&:id)
  end
end
