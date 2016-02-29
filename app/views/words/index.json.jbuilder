json.array!(@words) do |word|
  json.extract! word, :id, :type, :word_content
  json.url word_url(word, format: :json)
end
