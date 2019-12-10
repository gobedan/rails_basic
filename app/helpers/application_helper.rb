module ApplicationHelper
  def get_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_messages 
    content_tag :div, class: "flash-messages" do 
      flash.each do |key, message| 
        # насколько приемлимы условные интерполяции? 
        concat(content_tag :p, message, 
                               class: "flash-#{key} alert alert-#{"danger" if key == "alert"}#{"success" if key == "notice"}"
        )
      end
    end
  end
end
