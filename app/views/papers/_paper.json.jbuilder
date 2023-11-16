json.extract! paper, :id, :name, :category, :release_date, :language, :created_at, :updated_at
json.url paper_url(paper, format: :json)
