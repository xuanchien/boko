module PageTitleHelper
  def page_title
    return I18n.t("title.#{controller_name}.#{action_name}", :default => "BoKo.VN")
  end
end