class PagesController < ApplicationController
  prepend_view_path 'plugins/loomio_org_plugin/views'
  Plugins::LoomioOrg::Plugin::LOOMIO_ORG_PAGES.each { |page| define_method page, ->{} }

  before_action :set_locale_specific_links

  layout false, only: [:index, :pricing]

  private

  def set_locale_specific_links
    case I18n.locale.to_s
    when 'es'
      @help_link = 'https://loomio.gitbooks.io/manual/content/es/index.html'
      @blog_link = 'http://blog.loomio.org/category/espanol-castellano/'
    else
      @help_link = 'https://help.loomio.org'
      @blog_link = 'https://blog.loomio.org/category/stories'
    end
  end
end
