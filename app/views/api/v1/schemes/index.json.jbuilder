json.schemes @schemes, :id, :logo,
                       :contact_name, :contact_email, :contact_phone,
                       :name, :website, :description,
                       :location_ids,
                       :sector_ids,
                       :activity_ids,
                       :company_size_ids,
                       :age_range_ids
if @total
  json.total @total
  json.page  @page
  json.per_page @per_page
end
