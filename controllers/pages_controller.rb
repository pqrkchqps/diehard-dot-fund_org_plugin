class PagesController < ApplicationController
  prepend_view_path 'plugins/diehard-dot-fund_org_plugin/views'
  Plugins::DiehardFundOrg::Plugin::DIEHARD_FUND_ORG_PAGES.each { |page| define_method page, ->{} }

  before_action :set_locale_specific_links

  private

  def set_locale_specific_links
    case I18n.locale.to_s
    when 'es'
      @help_link = 'https://diehard_fund.gitbooks.io/manual/content/es/index.html'
      @blog_link = 'http://blog.diehard.fund/category/espanol-castellano/'
    else
      @help_link = 'https://help.diehard.fund'
      @blog_link = 'https://blog.diehard.fund/category/stories'
    end
  end
end
