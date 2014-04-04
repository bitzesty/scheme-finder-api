class Activity < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: ID_FOR_ALL, name: "All Activities", for_businesses: "All Activities", for_teachers: "All Activities" },
    { id: "apprenticeships", name: "Apprenticeships", for_businesses: "Offer an apprenticeship", for_teachers: "Organise an apprenticeship" },
    { id: "work_experience", name: "Work experience", for_businesses: "Offer work experience", for_teachers: "Organise work experience" },
    { id: "workplace_visits", name: "Workplace visits", for_businesses: "Host a visit", for_teachers: "Go on a visit" },
    { id: "hands_on_talks", name: "Hands-on activities", for_businesses: "Provide hands-on activities", for_teachers: "Organise hands-on activites" },
    { id: "inspiring_talks", name: "Inspiring talks", for_businesses: "Give a talk", for_teachers: "Host a talk" },
    { id: "ambassadors", name: "Ambassadors", for_businesses: "Be an ambassador", for_teachers: "Work with an ambassador" },
    { id: "lesson_materials", name: "Lesson materials", for_businesses: "Provide lesson materials", for_teachers: "Lesson materials" },
    { id: "mentoring", name: "Mentoring", for_businesses: "Be a mentor", for_teachers: "Organise mentoring" },
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
