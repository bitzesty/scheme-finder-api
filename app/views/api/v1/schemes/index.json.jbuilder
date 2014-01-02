json.schemes @schemes, :id, :logo
if @total
  json.total @total
  json.page  @page
  json.per_page @per_page
end
