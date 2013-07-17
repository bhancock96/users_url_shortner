post '/urls' do
  url = Url.create(url: params[:url], click_count: 0)
  redirect "/s/#{url.id}"
  # have data
  # create url object
  # redirect page displaying url information
end

get '/s/:id' do
  @url = Url.find_by_id(params[:id])
  erb :url
  # find url in database by id
  # display url information
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @url.click_count += 1
  @url.save

  redirect "#{@url.url}"
  # go to url that is associated with short url
  # increase click count
  # save to database
end
