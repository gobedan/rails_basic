module BadgesHelper
  def mapped_rules
    BadgeService::RULES.map { |rule| [t("admin.badges.rules.#{rule}"), rule] }
  end
end
