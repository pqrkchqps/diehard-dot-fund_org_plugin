module Plugins
  module LoomioOrg
    class Plugin < Plugins::Base
      setup! :loomio_org do |plugin|
        plugin.enabled = true

        plugin.use_component :angular_feedback_card, outlet: 'after_start_menu'

        LOOMIO_ORG_PAGES = %w(about
                              browser_not_supported
                              crowdfunding_celebration
                              pricing
                              privacy
                              purpose
                              terms_of_service
                              third_parties
                              translation
                              wallets)
        LOOMIO_ORG_PAGES.each { |page| plugin.use_page page, "pages##{page}" }
        plugin.use_class 'controllers/pages_controller'

        plugin.use_page :blog,          'http://blog.loomio.org',                                redirect: true
        plugin.use_page :press,         'http://blog.loomio.org/press-pack',                     redirect: true
        plugin.use_page :"press-pack",  'http://blog.loomio.org/press-pack',                     redirect: true
        plugin.use_page :roadmap,       'https://trello.com/b/tM6QGCLH/loomio-roadmap',          redirect: true
        plugin.use_page :community,     'https://www.loomio.org/g/WmPCB3IR/loomio-community',    redirect: true
        plugin.use_page :timeline,      'http://www.tiki-toki.com/timeline/entry/313361/Loomio', redirect: true

      end
    end
  end
end
