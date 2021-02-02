module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{ author } - TestGuru", repo, target: :_blank , rel: :nofollow
  end

end
