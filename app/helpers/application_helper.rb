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
                               class: "flash-#{key} alert #{flash_message_bootstrap_class(key)}"
        )
      end
    end
  end

  private 

  def flash_message_bootstrap_class(key)
    if key == "alert"
      "alert-danger"
    else
      "alert-success"
    end
  end
end
