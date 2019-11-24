# frozen_string_literal: true

class Scrap
  require 'nokogiri'
  require 'open-uri'

  BASE_LINK = 'https://www.remotelyawesomejobs.com/'

  def initialize
    page = Nokogiri::HTML(open(BASE_LINK))
    @jobs = page.css('ul.featured li')
  end

  def job_links
    data = []
    @jobs.each do |list|
      link = list.css('h2 a').attribute('href').value
      detail_page = Nokogiri::HTML(open(BASE_LINK + link))
      main_tag = detail_page.css('main')
      title = title(main_tag)
      stack = stack(main_tag)
      recruiter = recruiter(main_tag)
      location = location(main_tag)
      description = description(main_tag).to_html
      data << { title: title, stack: stack, recruiter: recruiter, location: location, description: description }
    end
    data
  end

  private

  def title(main_tag)
    main_tag.css('.job-title').text
  end

  def recruiter(main_tag)
    main_tag.css('.job-company span').text
  end

  def location(main_tag)
    main_tag.css('.job-company h2').text
  end

  def description(main_tag)
    main_tag.css('.job-description')
  end

  def stack(main_tag)
    stack = []
    main_tag.css('.tags').each do |tag|
      stack << tag.css('no-break a').text
    end

    stack
  end
end

scrap = Scrap.new
scrap.job_links
