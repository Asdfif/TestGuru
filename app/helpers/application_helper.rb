module ApplicationHelper

  def year_now
    Time.now.year
  end

  def github_url(author, repo)
    link_to "#{author} - TestGuru", repo.to_s
  end

end
