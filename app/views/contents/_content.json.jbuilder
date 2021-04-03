json.extract! content, :id, :content_type, :title, :content_review_notes, :rating, :movie_link, :release_date, :created_at, :updated_at
json.url content_url(content, format: :json)
